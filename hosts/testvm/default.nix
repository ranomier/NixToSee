{
  pkgs,
  lib,
  ...
}: {
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  networking.hostName = "testvm";
  security.pam.services.sshd.allowNullPassword = true;
  environment.systemPackages = [pkgs.neovim];

  users.users.alice = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    initialPassword = "test";
  };
  services.openssh = {
    enable = true;
  };
  # if firewall is enabled inside the VM, allow ssh:
  networking.firewall.enable = false;

  services.nginx = let
    tlsCert =
      # https://discourse.nixos.org/t/have-nix-auto-generate-a-sslcertificate-for-nginx-virtual-host/38358/4
      pkgs.runCommand "selfSignedCert"
      {
        buildInputs = [
          pkgs.openssl
        ];
      }
      ''
        mkdir -p $out
        openssl req -x509 -newkey ec -pkeyopt ec_paramgen_curve:secp384r1 -days 365 -nodes \
          -keyout $out/cert.key -out $out/cert.crt \
          -subj "/CN=localhost" -addext "subjectAltName=DNS:localhost,IP:127.0.0.1"
      '';
  in {
    enable = true;
    virtualHosts."*.*" = {
      addSSL = true;
      sslCertificate = "${tlsCert}/cert.crt";
      sslCertificateKey = "${tlsCert}/cert.key";
      extraConfig = ''
        error_log /var/log/nginx/my_error.log warn;
      '';
      listen = [
        {
          addr = "0.0.0.0";
          port = 443;
          ssl = true;
        }
      ];
      locations."/" = {
        proxyPass = "https://127.0.0.1:9200"; # insecure mog net
        extraConfig = ''
          proxy_set_header Host $host:9200;
          #proxy_set_header Host $host;
          proxy_set_header X-Real-IP $remote_addr;
          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
          proxy_set_header X-Forwarded-Proto $scheme;
          #proxy_set_header Origin https://localhost:29200;
        '';
      };
    };
  };

  services.opencloud = {
    enable = true;
    address = "0.0.0.0";
    url = "https://localhost:9200";
    environment = {
      #OC_INSECURE = "true"; # Scheint nichts zu tun
      #INSECURE = "true"; # Jo guckste eins oben
      ADMIN_PASSWORD = "YourSecurePassword";
      PROXY_HTTP_ADDR = "0.0.0.0:9200";
    };
  };
}

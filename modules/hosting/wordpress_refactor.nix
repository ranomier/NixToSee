{
  config,
  pkgs,
  lib,
  ...
}: let
  siteOpts = lib.types.submodule ({...}: {
    options = {
      enable = lib.mkEnableOption "custom WordPress service";

      siteName = lib.mkOption {
        type = lib.types.nullOr lib.types.str;
        default = null;
      };

      sitePort = lib.mkOption {
        type = lib.types.port;
        default = 80;
        description = ""; # TODO:
      };
    };
  });

  cfg = config.services.cWordpress;

  opts = siteName: rec {
    siteDataDir = "/srv/http/${siteName}";
    siteUser = "user-${siteName}";
    siteGroup = config.services.nginx.user;
    siteUserPhp = "${siteUser}-php";
    siteGroupPhp = siteUserPhp;
    sitePhpPool = "wordpress-${siteName}";
  };
in {
  options = {
    services.cWordpress = lib.mkOption {
      type = lib.types.attrsOf siteOpts;

      default = {};
      description = ""; # TODO:
    };
  };

  config = {
      users.users = lib.mapAttrs' (siteName: siteConfig: {
        "user-${siteName}" = {
          isSystemUser = true;
          group = config.services.nginx.user;
          home = "/srv/http/${siteName}";
          createHome = false;
          shell = "${pkgs.shadow}/bin/nologin";
        };

        "user-${siteName}-php" = {
          isSystemUser = true;
          group = "user-${siteName}-php";
          home = "/var/empty";
          createHome = false;
          shell = "${pkgs.shadow}/bin/nologin";
        };
      }) cfg;

      users.groups = lib.mapAttrs' (siteName: siteConfig: {
        ${config.services.nginx.user} = {};
        "user-${siteName}-php" = {};
      }) cfg;

      # services = {
      #   mysql = {
      #     enable = true;
      #     package = pkgs.mariadb;
      #   };
      #
      #   phpfpm.pools."${sitePhpPool}" = {
      #     user = siteUserPhp;
      #     group = siteGroupPhp;
      #
      #     settings = {
      #       # Socket ownership so Nginx can connect
      #       "listen.owner" = config.services.nginx.user;
      #       "listen.group" = siteGroupPhp;
      #       "listen.mode" = "0660";
      #
      #       # Dynamic process management tuned for small sites
      #       pm = "dynamic";
      #       "pm.max_children" = "5";
      #       "pm.start_servers" = "2";
      #       "pm.min_spare_servers" = "1";
      #       "pm.max_spare_servers" = "3";
      #
      #       # Logging
      #       "catch_workers_output" = true;
      #       "php_admin_flag[log_errors]" = true;
      #     };
      #   };
      #
      #   nginx = {
      #     enable = true;
      #     virtualHosts."${siteName}" = {
      #       default = true;
      #       root = siteDataDir;
      #
      #       listen = [
      #         {
      #           addr = "0.0.0.0";
      #           port = opts.sitePort;
      #           ssl = false;
      #         }
      #       ];
      #
      #       # Fallback for pretty permalinks
      #       locations."/" = {
      #         tryFiles = "$uri $uri/ /index.php?$args";
      #       };
      #
      #       extraConfig = ''
      #         index index.php;
      #       '';
      #
      #       # Handle PHP scripts
      #       locations."~ \\.php$" = {
      #         extraConfig = ''
      #           fastcgi_split_path_info ^(.+\\.php)(/.+)$;
      #           fastcgi_pass          unix:${config.services.phpfpm.pools."${sitePhpPool}".socket};
      #           fastcgi_index         index.php;
      #           fastcgi_param         SCRIPT_FILENAME $document_root$fastcgi_script_name;
      #           include               ${pkgs.nginx}/conf/fastcgi_params;
      #         '';
      #       };
      #     };
      #   };
      # };
      #
      # # Bootstrap WordPress on activation
      # environment.systemPackages = [pkgs.unzip]; # TODO: why is unzip needed here?
      # system.activationScripts."setupWordpress-${siteName}".text = ''
      #   mkdir -p ${siteDataDir}
      #   if [ ! -f ${siteDataDir}/wp-config.php ]; then
      #     cp -R ${pkgs.wordpress}/share/wordpress/* ${siteDataDir}/
      #     chown -R ${siteUser}:${siteGroup} ${siteDataDir}
      #     chmod -R 755 ${siteDataDir}
      #   fi
      # ''; # TODO: tighten permissions (not 755)
    };
}

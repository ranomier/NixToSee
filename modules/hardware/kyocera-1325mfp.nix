{ stdenv, lib, fetchFromGitHub, cmake, cups }:

stdenv.mkDerivation rec {
  pname = "kyocera-rastertokpsl-re";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "prokinkd";
    repo = "rastertokpsl-re";
    rev = "v${version}";
    sha256 = "sha256-70kJQji26tY3wq//UT+JEpZMtlIK+U60Mc4NVqytiOo=";
  };

  nativeBuildInputs = [ cmake ];
  buildInputs = [ cups ];

  cmakeFlags = [ "-DCMAKE_BUILD_TYPE=Release" ];

  installPhase = ''
    mkdir -p $out/lib/cups/filter
    mkdir -p $out/share/cups/model/kyocera

    cp ../bin/rastertokpsl-re $out/lib/cups/filter/rastertokpsl
    chmod +x $out/lib/cups/filter/rastertokpsl

    cp ../Kyocera_FS-1325MFPGDI.ppd $out/share/cups/model/kyocera/
  '';

  postFixup = ''
    echo "Performing substitution..."
    sed -i "s|/usr/lib/cups/filter/rastertokpsl|$out/lib/cups/filter/rastertokpsl|g" \
      $out/share/cups/model/kyocera/Kyocera_FS-1325MFPGDI.ppd
  '';

  meta = with lib; {
    description = "Kyocera KPSL filter for CUPS - FS-1325MFP support";
    homepage = "https://github.com/prokinkd/rastertokpsl-re";
    license = licenses.asl20;
    platforms = platforms.linux;
  };
}

{ stdenv
, lib
, fetchFromGitHub
, cmake
, pkg-config
, gtk3
, wrapGAppsHook
, jansson
, libgcrypt
, libzip
, libpng
, libcotp
, zbar
}:

stdenv.mkDerivation rec {
  pname = "otpclient";
  version = "2.4.8";

  src = fetchFromGitHub {
    owner = "paolostivanin";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-2exqMYcxg0UxlH+ZANQv2MFii9dZ6nizB4vxGR9cAwk=";
  };

  buildInputs = [ gtk3 jansson libgcrypt libzip libpng libcotp zbar ];
  nativeBuildInputs = [ cmake pkg-config wrapGAppsHook ];

  meta = with lib; {
    description = "Highly secure and easy to use OTP client written in C/GTK that supports both TOTP and HOTP";
    homepage = "https://github.com/paolostivanin/OTPClient";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ alexbakker ];
  };
}

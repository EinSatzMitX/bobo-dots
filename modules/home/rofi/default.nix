{
  host,
  profile,
  ...
}: let
  inherit
    (import ../../../hosts/${host}/themes/${profile}.nix)
    rofiImage
    ;
in {
  imports = [
    ./config-long.nix
    ./rofi.nix
  ];
}

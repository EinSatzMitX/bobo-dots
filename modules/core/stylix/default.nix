{
  pkgs,
  host,
  profile,
  ...
}: let
  inherit (import ../../../hosts/${host}/themes/${profile}.nix) stylixImage;
in {
  imports = [
    ./${profile}.nix
  ];
  # Styling Options
  stylix = {
    enable = true;
    image = stylixImage;

    opacity.terminal = 1.0;
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrains Mono";
      };
      sansSerif = {
        package = pkgs.montserrat;
        name = "Montserrat";
      };
      serif = {
        package = pkgs.montserrat;
        name = "Montserrat";
      };
      sizes = {
        applications = 12;
        terminal = 15;
        desktop = 11;
        popups = 12;
      };
    };
  };
}

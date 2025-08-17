{
  config,
  pkgs,
  ...
}: let
  flathub = {
    name = "flathub";
    url = "https://dl.flathub.org/repo/flathub.flatpakrepo";
  };
in {
  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-hyprland];
    configPackages = [pkgs.hyprland];
  };
  services = {
    flatpak.enable = true; # Enable Flatpak
  };
  systemd.services.flatpak-repo = {
    wantedBy = ["multi-user.target"];
    path = [pkgs.flatpak];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

      flatpak override --user --filesystem=home com.spotify.Client

    '';
  };
}

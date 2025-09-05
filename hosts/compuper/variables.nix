{
  # Git Configuration ( For Pulling Software Repos )
  gitUsername = "EinSatzMitX";
  gitEmail = "EinSatzMitX@users.noreply.github.com";

  # Hyprland Settings
  # ex: extraMonitorSettings = "monitor = Virtual-1,1920x1080@60,auto,1";
  # ex: extraMonitorSettings = "monitor = HDMI-A-1,1920x1080@60,auto,1";
  extraMonitorSettings = "
    # 1. DP-1 (Asus VG278) links, 144 Hz
     monitor=DP-1,1920x1080@144.001007,0x0,1

     # 2. DP-2 (Iiyama PL2492H) rechts, 75 Hz
     monitor=DP-2,1920x1080@74.973000,1920x0,1
  ";

  # Waybar Settings
  clock24h = true;

  # Program Options
  browser = "brave"; # Set Default Browser (google-chrome-stable for google-chrome)
  terminal = "kitty"; # Set Default System Terminal
  keyboardLayout = "de";
  consoleKeyMap = "de";

  # For Nvidia Prime support
  # (not necessary on my machine)
  intelID = "PCI:1:0:0";
  nvidiaID = "PCI:0:2:0";

  # Enable NFS
  enableNFS = true;

  # Enable Printing Support
  printEnable = false;

  # Set Waybar
  #  Available Options:
  # waybarChoice = ../../modules/home/waybar/waybar-curved.nix;
  # waybarChoice = ../../modules/home/waybar/waybar-ddubs.nix;
  # waybarChoice = ../../modules/home/waybar/waybar-ddubs-2.nix;
  # waybarChoice = ../../modules/home/waybar/waybar-simple.nix;
  waybarChoice = ../../modules/home/waybar/Jerry-waybar.nix;

  # Set Animation style
  # Available options are:
  # animations-def.nix  (default)
  # animations-end4.nix (end-4 project)
  # animations-dynamic.nix (ml4w project)
  # animations-moving.nix (ml4w project)
  animChoice = ../../modules/home/hyprland/animations-moving.nix;

  # Enable Thunar GUI File Manager
  thunarEnable = true;
}

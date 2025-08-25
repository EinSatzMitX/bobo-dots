{
  pkgs,
  inputs,
  ...
}: {
  programs = {
    firefox.enable = false; # Firefox is not installed by default
    hyprland.enable = true; #someone forgot to set this so desktop file is created
    dconf.enable = true;
    seahorse.enable = true;
    fuse.userAllowOther = true;
    mtr.enable = true;
    adb.enable = true;
    hyprlock.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs;
    [
      appimage-run # Needed For AppImage Support
      aseprite # Pixelart editor
      bat # Cooler cat
      blender # 3D Modeling Software
      brave # Brave Browser
      btop # System Task Manager
      brightnessctl # For Screen Brightness Control
      cbonsai # Bonsai tree generator in terminal
      cliphist # Clipboard manager using rofi menu
      cmatrix # Matrix Movie Effect In Terminal
      cowsay # Great Fun Terminal Program
      docker-compose # Allows Controlling Docker From A Single File
      duf # Utility For Viewing Disk Usage In Terminal
      eza # Beautiful ls Replacement
      fastfetch # System info
      ffmpeg # Terminal Video / Audio Editing
      file-roller # Archive Manager
      flatpak # -1.000.000 social credit for using purely functional and declarative configs
      gcc # If you don't know what this is, go fuck yourself
      gedit # Simple Graphical Text Editor
      gimp # GNU Image Manipulation Tool
      gitui # Git UI terminal program
      glibc # I'm not quite sure why a build package is in my system packages, but I'm too afraid to remove it
      glxinfo #needed for inxi diag util
      godot # Open source game engine
      tuigreet # The Login Manager (Sometimes Referred To As Display Manager)
      htop # Simple Terminal Based System Monitor
      hyprpicker # Color Picker
      eog # For Image Viewing
      inxi # CLI System Information Tool
      killall # For Killing All Instances Of Programs
      legendary-heroic # Epic games launcher
      libnotify # For Notifications
      libreoffice # Open-source Microsoft Office, if you want to say so
      lm_sensors # Used For Getting Hardware Temps
      lmms # DAW software
      lolcat # Add Colors To Your Terminal Command Output
      lshw # Detailed Hardware Information
      lutris # Game Launcher for EXE files
      manim # Python lib/program to create math animations
      mako # # Notification daemon, because swaync crashes
      mpv # Incredible Video Player
      nautilus # GUI File manager, for drag&drop windows
      ncdu # Disk Usage Analyzer With Ncurses Interface
      nixfmt-rfc-style # Nix Formatter
      nwg-displays #configure monitor configs via GUI
      onefetch # fetches information of a git repo
      obsidian # Markdown Document Editor
      obs-studio # Video recording software
      openrazer-daemon # Daemon for Razer devices
      pavucontrol # For Editing Audio Levels & Devices
      pciutils # Collection Of Tools For Inspecting PCI Devices
      picard # For Changing Music Metadata & Getting Cover Art
      pipes-rs # Pipes.sh but in rust
      pkg-config # Wrapper Script For Allowing Packages To Get Info On Others. Also not sure why this is in my system packages
      playerctl # Allows Changing Media Volume Through Scripts
      polychromatic # For configuring razer devices
      prismlauncher # Minecraft Launcher
      quickshell # Framework for creating cool looking widgets
      r2modman # Mod manager for Steam games
      # rhythmbox
      ripgrep # Improved Grep
      rust-analyzer
      rustup
      satisfactorymodmanager # Mod manager for Satisfactory
      scarab # Hollow Knight mod manager
      socat # Needed For Screenshots
      solaar # For configuring LogiTech devices
      # spotify-player # Spotify TUI application
      st # Simple terminal for testing cli and tui applications
      tokei # Utility or Counting lines of code
      unrar # Tool For Handling .rar Files
      unzip # Tool For Handling .zip Files
      usbutils # Good Tools For USB Devices
      v4l-utils # Used For Things Like OBS Virtual Camera
      vesktop # Discord client
      virtualbox # VM for occasionally testing own code
      vscode # Alternative code editor to nvim
      wget # Tool For Fetching Files With Links
      winePackages.stable # Required for running EXE files on linux
      wlr-randr # Tool for getting display information
      ytmdl # Tool For Downloading Audio From YouTube
    ]
    ++ (inputs.nix-gaming.lib.legendaryBuilder pkgs
      {
        games = {
          rocket-league = {
            # find names with legendary list
            desktopName = "Rocket League";

            # find out on lutris/winedb/protondb
            tricks = ["dxvk" "win10"];

            # google "<game name> logo"
            icon = builtins.fetchurl {
              # original url = "https://www.pngkey.com/png/full/16-160666_rocket-league-png.png";
              url = "https://user-images.githubusercontent.com/36706276/203341314-eaaa0659-9b79-4f40-8b4a-9bc1f2b17e45.png";
              name = "rocket-league.png";
              sha256 = "0a9ayr3vwsmljy7dpf8wgichsbj4i4wrmd8awv2hffab82fz4ykb";
            };

            # if you don't want winediscordipcbridge running for this game
            discordIntegration = false;
            # if you dont' want to launch the game using gamemode
            gamemodeIntegration = false;

            preCommands = ''
              echo "the game will start!"
            '';

            postCommands = ''
              echo "the game has stopped!"
            '';
          };
        };

        opts = {
          # same options as above can be provided here, and will be applied to all games
          # NOTE: game-specific options take precedence
          wine = inputs.nix-gaming.packages.${pkgs.system}.wine-tkg;
        };
      });
  # So I don't build gcc when building nix-gaming
  nix.settings = {
    substituters = ["https://nix-gaming.cachix.org"];
    trusted-public-keys = ["nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="];
  };
}

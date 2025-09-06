{
  pkgs,
  config,
  host,
  lib,
  profile,
  ...
}: let
  terminal = "kitty";
  inherit (import ../../../hosts/${host}/themes/${profile}.nix) base;
in
  with lib; {
    # Configure & Theme Waybar
    programs.waybar = {
      enable = true;
      package = pkgs.waybar;
      settings = [
        {
          layer = "top";
          position = "top";

          modules-center = ["network" "pulseaudio" "cpu" "hyprland/workspaces" "memory" "clock"]; # Eterna: [ "hyprland/window" ]
          modules-left = ["custom/startmenu" "hyprland/window"]; # Eternal:  [ "hyprland/workspaces" "cpu" "memory" "network" ]
          modules-right = ["tray" "custom/notification" "custom/exit"]; # Eternal: [ "idle_inhibitor" "pulseaudio" "clock"  "custom/notification" "tray" ]

          "hyprland/workspaces" = {
            format = "{name}";
            format-icons = {
              default = " ";
              active = " ";
              urgent = " ";
            };
            on-scroll-up = "hyprctl dispatch workspace e+1";
            on-scroll-down = "hyprctl dispatch workspace e-1";
          };
          "clock" = {
            format = '' {:%H:%M}'';
            /*
            ''{: %I:%M %p}'';
            */
            tooltip = true;
            tooltip-format = "<big>{:%A, %d.%B %Y }</big><tt><small>{calendar}</small></tt>";
          };
          "hyprland/window" = {
            max-length = 60;
            separate-outputs = false;
          };
          "memory" = {
            interval = 5;
            format = " {}%";
            tooltip = true;
            on-click = "${terminal} -e btop";
          };
          "cpu" = {
            interval = 5;
            format = " {usage:2}%";
            tooltip = true;
            on-click = "${terminal} -e btop";
          };
          "disk" = {
            format = " {free}";
            tooltip = true;
            # Not working with zaneyos window open then closes
            # on-click = "${terminal} -e sh -c df -h ; read";
            on-click = "${terminal} -e lsblk | bc";
          };
          "network" = {
            format-icons = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
            format-ethernet = " {bandwidthDownBits}";
            format-wifi = " {bandwidthDownBits}";
            format-disconnected = "󰤮";
            tooltip = false;
            on-click = "${terminal} -e btop";
          };
          "tray" = {
            spacing = 12;
          };
          "pulseaudio" = {
            format = "{icon} {volume}% {format_source}";
            format-bluetooth = "{volume}% {icon} {format_source}";
            format-bluetooth-muted = " {icon} {format_source}";
            format-muted = " {format_source}";
            format-source = " {volume}%";
            format-source-muted = "";
            format-icons = {
              headphone = "";
              hands-free = "";
              headset = "";
              phone = "";
              portable = "";
              car = "";
              default = ["" "" ""];
            };
            on-click = "pavucontrol";
          };
          "custom/exit" = {
            tooltip = false;
            format = "⏻";
            on-click = "sleep 0.1 && wlogout";
          };
          "custom/startmenu" = {
            tooltip = false;
            format = " ";
            # exec = "rofi -show drun";
            on-click = "rofi -show drun";
          };
          "idle_inhibitor" = {
            format = "{icon}";
            format-icons = {
              activated = " ";
              deactivated = " ";
            };
            tooltip = "true";
          };
          "custom/notification" = {
            tooltip = false;
            format = "{icon} {}";
            format-icons = {
              notification = "<span foreground='red'><sup></sup></span>";
              none = "";
              dnd-notification = "<span foreground='red'><sup></sup></span>";
              dnd-none = "";
              inhibited-notification = "<span foreground='red'><sup></sup></span>";
              inhibited-none = "";
              dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>";
              dnd-inhibited-none = "";
            };
            return-type = "json";
            exec-if = "which swaync-client";
            exec = "swaync-client -swb";
            on-click = "swaync-client -t";
            escape = true;
          };
          "battery" = {
            states = {
              warning = 30;
              critical = 15;
            };
            format = "{icon} {capacity}%";
            format-charging = "󰂄 {capacity}%";
            format-plugged = "󱘖 {capacity}%";
            format-icons = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
            on-click = "";
            tooltip = false;
          };
        }
      ];
      style = concatStrings [
        ''
                    * {
                      font-size: 16px;
                      font-family: JetBrainsMono Nerd Font, Font Awesome, sans-serif;
                      font-weight: bold;
                    }
                    window#waybar {
            background-color: rgba(36,39,58,0.8);
            border-bottom: 1px solid rgba(30,32,48,0.8);
            border-radius: 0px;
            color: #${base.base05};

            /* Fix spacing */
            padding: 0px 10px;   /* adds space at left + right edges */
          }

          .modules-left {
            margin-left: 25px;
          }

          .modules-right {
            margin-right: 25px;
          }

          .modules-center {
            margin: 0px 20px; /* centers the rainbow better */
          }


                    #workspaces, #window {
                      background: linear-gradient(90deg,
                        #${base.base08}, /* red */
                        #${base.base09}, /* peach */
                        #${base.base0A}, /* yellow */
                        #${base.base0B}, /* green */
                        #${base.base0C}, /* teal */
                        #${base.base0D}, /* blue */
                        #${base.base0E}  /* mauve */
                      );
                      margin: 5px;
                      padding: 2px 20px;
                      border-radius: 15px;
                      border: 0px;
                      color: #${base.base00};
                    }

                    #workspaces button {
                      padding: 0px 5px;
                      margin: 4px 3px;
                      border-radius: 15px;
                      border: 0px;
                      color: #${base.base00};
                      background: #${base.base02};
                      opacity: 0.7;
                      transition: all 0.3s ease-in-out;
                    }

                    #workspaces button.active {
                      background: #${base.base05};
                      color: #${base.base00};
                      opacity: 1.0;
                      min-width: 40px;
                    }

                    #workspaces button:hover {
                      background: #${base.base03};
                      color: #${base.base05};
                      opacity: 0.9;
                    }

                    tooltip {
                      background: #${base.base01};
                      border: 1px solid #${base.base0E};
                      border-radius: 10px;
                    }

                    tooltip label {
                      color: #${base.base05};
                    }

                    #clock {
                      color: #${base.base0B};
                      background: #${base.base01};
                      border-radius: 15px;
                      margin: 5px;
                      padding: 2px 20px;
                    }

                    #cpu {
                      color: #${base.base0D};
                      background: #${base.base01};
                      border-radius: 15px;
                      margin: 5px;
                      padding: 2px 20px;
                    }

                    #memory {
                      color: #${base.base0F};
                      background: #${base.base01};
                      border-radius: 15px;
                      margin: 5px;
                      padding: 2px 20px;
                    }

                    #network {
                      color: #${base.base0C};
                      background: #${base.base01};
                      border-radius: 15px;
                      margin: 5px;
                      padding: 2px 20px;
                    }

                    #pulseaudio {
                      color: #${base.base0A};
                      background: #${base.base01};
                      border-radius: 15px;
                      margin: 5px;
                      padding: 2px 20px;
                    }

                    #battery {
                      color: #${base.base08};
                      background: #${base.base01};
                      border-radius: 15px;
                      margin: 5px;
                      padding: 2px 20px;
                    }

                    #tray {
                      color: #${base.base05};
                      background: #${base.base01};
                      border-radius: 15px;
                      margin: 5px;
                      padding: 2px 20px;
                    }
        ''
      ];
    };
  }

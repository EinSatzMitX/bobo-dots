# My NixOS config

---

**Thanks to zaney, for making this config possible!**

If you want to clone this config, follow the blog on the
[Zaneyos wiki](https://zaney.org/wiki/zaneyos-2.3/installing-zaneyos/)

---

I changed some things, and things might break on your machine, especially
regarding the fact that I'm using the unmstable branch.

## How to configure

One of the easiest and quickest ways to configure the setup, is to change your
profile. Currently there are two profiles: gruvbox-dark and catpuccin-macchiato
(make sure to spell that correctly). They are both dark mode profiles and
include their own respectively named files.

## Configured Programs

- [Fastfetch](https://github.com/fastfetch-cli/fastfetch)
- [Hyprland](https://github.com/hyprwm/Hyprland)
- [Quickshell](https://quickshell.org/)
  - (I'm not using this right now, however home manager still copies all the
    config to $HOME/.config/quickshell)
- [Rofi](https://github.com/davatorium/rofi)
- [Waybar](https://github.com/Alexays/Waybar)
  - (There are multiple styling options, again thanks to zaney, just look into
    hosts/${hostname}/variables.nix)
- [Wlogout](https://github.com/ArtsyMacaw/wlogout)
- [Yazi](https://github.com/sxyazi/yazi)
- [Zsh](https://github.com/zsh-users/zsh)
- [Btop](https://github.com/aristocratos/btop)
- [fzf](https://github.com/junegunn/fzf)
- [GhosTTY](https://github.com/ghostty-org/ghostty)
  - (I'm not using this, so the config might be horrible)
- [Git](https://github.com/git/git)
- [Kitty](https://github.com/kovidgoyal/kitty)
- [Lazygit](https://github.com/jesseduffield/lazygit)
  - I'm not using this, however I am lazy
- [Mako](https://github.com/emersion/mako)
  - This is my substitute to swaync, as it is constantly crashing and causing
    issues with other programs like vencord
- [NVF](https://github.com/NotAShelf/nvf)
- [Stylix](https://github.com/nix-community/stylix)
  - Very useful, however stylix and my nixpkgs are out of sync
- [Swappy](https://github.com/jtheoof/swappy)
  - Tool for taking screenshots, they will automatically be saved, just look
    into the scripts folder
- [SwayNC](https://github.com/ErikReider/SwayNotificationCenter)
  - (I'm not currently using this, because it's crashing, however I still have a
    quite nice config for it) Directory Structure:
- [TUIGreet](https://github.com/apognu/tuigreet)

## Directory structure

- hosts
  - compuper (This is where you can add your hostname and change some variables)
    - variables.nix
- modules
  - core
    - This is where yyou core configuration sits, this will be used for all
      profiles and users
  - drivers
    - I might remove this soon, because I'm only using nvidia
  - home
    - This is your home directory, and all the stuff that belongs into
      $HOME/.config
- profiles
  - Again, I might remove this soon, as I'm only using one profile

- wallpapers
  - self-explanatory, all the pictures get copied into $HOME/Pictures/Wallpapers

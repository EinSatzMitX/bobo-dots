{
  description = "My NixOS dotfiles";

  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
    stylix.url = "github:danth/stylix/release-25.05";
    nix-gaming.url = "github:fufexan/nix-gaming";
  };
  outputs = {
    self,
    nixpkgs,
    nvf,
    stylix,
    nix-gaming,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    host = "compuper";
    # profile = "gruvbox-dark";
    profile = "catpuccin-macchiato";
    username = "bobo";
  in {
    nixosConfigurations = {
      gruvbox-dark = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          inherit username;
          inherit host;
          inherit profile;
        };
        modules = [./profiles/gruvbox-dark];
      };
      gruvbox-light = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          inherit username;
          inherit host;
          inherit profile;
        };
        modules = [./profiles/gruvbox-light];
      };
      catpuccin-mocha = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          inherit username;
          inherit host;
          inherit profile;
        };
        modules = [./profiles/catpuccin-mocha];
      };
      catpuccin-macchiato = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          inherit username;
          inherit host;
          inherit profile;
        };
        modules = [./profiles/catpuccin-macchiato];
      };
    };
  };
}

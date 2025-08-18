{
  description = "My NixOS dotfiles";

  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
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
    profile = "nvidia";
    username = "bobo";
  in {
    nixosConfigurations = {
      nvidia = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          inherit username;
          inherit host;
          inherit profile;
        };
        modules = [./profiles/nvidia];
      };
    };
  };
}

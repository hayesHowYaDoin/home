{
  description = "Reusable Home Manager modules for configuration across systems.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { 
    self,
    nixpkgs,
    ...
  }: {
    nixosModules = {
      cli = import ./cli;
      desktop = import ./desktop;
    };
  };
}

{ inputs, ... }:

let
  importModules = dir:
    let
      # List all Nix files in the directory, excluding default.nix
      files = builtins.filter (name: builtins.hasSuffix ".nix" name && name != "default.nix")
        (builtins.attrNames (builtins.readDir dir));
        
      # Create an attribute set where each file is imported as a module
      individualModules = builtins.listToAttrs (map (file: {
        name = builtins.substring 0 (builtins.stringLength file - 4) file; # Remove .nix extension
        value = import (dir + "/${file}");
      }) files);
    in
    individualModules // {
      # The 'default' attribute aggregates all modules in this directory.
      # Use to get all configurations in a category.
      default = { config, lib, pkgs, ... }: {
        imports = builtins.map (name: individualModules.${name}) (builtins.attrNames individualModules);
      };
    };

in {
  cli = importModules ./cli;
  desktop = importModules ./desktop;
}

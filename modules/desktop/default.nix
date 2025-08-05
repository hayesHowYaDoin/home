{ pkgs, ... }:

{
  imports = [
    ./fonts.nix
    ./ghostty.nix
    ./hyprland.nix
    ./kitty.nix
    ./plasma.nix
    ./vscode.nix
    ./wayland.nix
    ./xdg.nix
  ];
}

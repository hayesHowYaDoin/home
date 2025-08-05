{ config, lib, pkgs, ... }:

{
  imports = [
    ./git.nix
    ./helix.nix
    ./neofetch.nix
    ./zsh.nix
  ];

  packages = with pkgs; {
    editors = [
      neovim
      tmux
    ];
    util = [
      caligula
      coreutils
      du-dust
      htop
      nvtopPackages.full
      usbutils
      zip
    ];
    navigation = [
      bat
      eza
      fd
      fzf
      ripgrep
      tldr
      yazi
      zoxide
    ];
    vanity = [
      chafa
      nitch
      oh-my-posh
    ];
    development = [
      devenv
      direnv
      gitui
      presenterm
      typst
    ];

    all = editors ++ util ++ navigation ++ vanity ++ development;
  };
}

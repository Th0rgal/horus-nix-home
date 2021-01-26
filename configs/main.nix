{ config, pkgs, lib, ... }:

{
  imports = [
      ./i3.nix
      ./polybar.nix
      ./rofi.nix
      ./alacritty.nix
      ./compton.nix
      ./vscode.nix
  ];

  programs = {
    home-manager.enable = true;
    command-not-found.enable = true;
    git = {
      enable = true;
      userName = "Thomas Marchand";
      userEmail = "thomas.marchand" + "@" + "tuta.io";
    };


    zsh = {
      enable = true;
      plugins = [
        {
          name = "powerlevel10k";
          src = pkgs.zsh-powerlevel10k;
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }
        {
          name = "powerlevel10k-config";
          src = lib.cleanSource ./p10k-config;
          file = "p10k.zsh";
        }
      ];
    };
  };

  xsession.enable = true;

}
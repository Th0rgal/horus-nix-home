{ config, pkgs, lib, ... }:

{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    
    gotop htop neofetch zip unzip xorg.xev scrot 
    aria2 imagemagick feh (import ./alacritty-master.nix) # Till they fix the background_opacity bug
    vscodium typora
    zulu8 rustup gcc m4 gnumake binutils
    nerdfonts powerline-fonts roboto siji (import ./termsyn.nix) source-code-pro dejavu_fonts noto-fonts-emoji
    idea.idea-ultimate vlc
  ];

  programs = {
    home-manager.enable = true;
    command-not-found.enable = true;
    firefox.enable = true;

    # alacritty = import ./alacritty.nix { inherit pkgs; };
    rofi = import ./rofi.nix { inherit pkgs; };

    git = {
      enable = true;
      userName = "Thomas Marchand";
      userEmail = "thomas.marchand" + "@" + "tuta.io";
    };
  };
    
  xsession.windowManager.i3 = import ./i3.nix { inherit pkgs lib; };
  
  services = {
    compton = import ./compton.nix {};
    polybar = import ./polybar.nix { inherit pkgs; };
  };
}

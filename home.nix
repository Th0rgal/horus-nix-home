{ config, pkgs, lib, ... }:

with pkgs;
let
  my-python-packages = python-packages: with python-packages; [
    aiohttp
    pywal
    pygame
    pillow
    requests
  ];
  python-with-my-packages = python3.withPackages my-python-packages;
in
  {
    nixpkgs.config.allowUnfree = true;

    home.packages = with pkgs; [    
      gotop htop neofetch zip unzip xorg.xev scrot 
      aria2 imagemagick feh (import ./alacritty-master.nix) # Till they fix the background_opacity bug
      vscodium typora
      python-with-my-packages zulu8 rustup gcc m4 gnumake binutils
      powerline-fonts roboto siji (import ./termsyn.nix) source-code-pro dejavu_fonts noto-fonts-emoji
      idea.idea-ultimate vlc
      bastet multimc tigervnc
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

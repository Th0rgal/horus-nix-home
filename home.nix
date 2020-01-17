{ config, pkgs, lib, ... }:

with pkgs;
let
  my-python-packages = python-packages: with python-packages; [
    #server
    aiohttp
    aiohttp-jinja2
    #isn
    pygame
    pillow
    #ntru
    sympy
    numpy
    docopt
    #others
    faker
    pywal
    (callPackage ./discordpy.nix { })
  ];
  python-with-my-packages = python3.withPackages my-python-packages;
in
  {
    imports = [ ./i3.nix ./polybar.nix ./rofi.nix ];
    nixpkgs.config.allowUnfree = true;

    home.keyboard.layout = "fr";

    home.packages = with pkgs; [    
      # TERMINAL
      (import ./alacritty-master.nix) # Till they fix the background_opacity bug
      gotop htop neofetch cava zip unrar unzip xorg.xev scrot tree
      aria2 imagemagick feh
      # DEVELOPMENT
      idea.idea-ultimate vscodium (callPackage ./termius.nix { })
      python-with-my-packages zulu8 rustup gcc m4 gnumake binutils
      # OFFICE
      xfce4-14.thunar discord vlc spotify typora tor-browser-bundle-bin (callPackage ./wpsoffice.nix { })
      # GAMES
      bastet multimc tigervnc
    ];

    programs = {
      home-manager.enable = true;
      command-not-found.enable = true;
      firefox.enable = true;

      # alacritty = import ./alacritty.nix { inherit pkgs; };

      git = {
        enable = true;
        userName = "Thomas Marchand";
        userEmail = "thomas.marchand" + "@" + "tuta.io";
      };
    };
    
    services = {
      compton = import ./compton.nix {};
    };

    xsession.enable = true;
  }

{ config, pkgs, lib, ... }:

with pkgs;
let
  my-python-packages = python-packages: with python-packages; [
    black
    
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
    #database
    psycopg2
    #others
    pip
    wheel
    setuptools
    faker
    pywal
    (callPackage ./discordpy.nix { })
  ];
  python-with-my-packages = python3.withPackages my-python-packages;
in
  {
    imports = [ ./i3.nix ./polybar.nix ./rofi.nix ./alacritty.nix ./compton.nix ];
    nixpkgs.config.allowUnfree = true;

    home.keyboard.layout = "fr";
    home.packages = with pkgs; [
      # TERMINAL
      gotop htop neofetch cava zip unrar unzip xorg.xev escrotum tree gnupg
      aria2 imagemagick feh httpie
      # DEVELOPMENT
      idea.idea-ultimate vscodium (callPackage ./termius.nix { })
      python-with-my-packages conda zulu8 gradle rustup gcc m4 gnumake binutils
      # BLOCKCHAIN
      (callPackage ./ledger-live.nix { })
      # OFFICE
      texlive.combined.scheme-medium typora wpsoffice
      # DEFAULT
      brave discord vlc spotify gimp blueman
      # GAMES
      bastet multimc tigervnc
    ];

    programs = {
      home-manager.enable = true;
      command-not-found.enable = true;
      git = {
        enable = true;
        userName = "Thomas Marchand";
        userEmail = "thomas.marchand" + "@" + "tuta.io";
      };
    };

    xsession.enable = true;
  }

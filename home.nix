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
    imports = [ ./i3.nix ./polybar.nix ./rofi.nix ./alacritty.nix ];
    nixpkgs.config.allowUnfree = true;

    home.keyboard.layout = "fr";

    home.packages = with pkgs; [    
      # TERMINAL
      gotop htop neofetch cava zip unrar unzip xorg.xev escrotum tree gnupg
      aria2 imagemagick feh
      # DEVELOPMENT
      idea.idea-ultimate vscodium (callPackage ./termius.nix { })
      python-with-my-packages conda zulu8 gradle rustup gcc m4 gnumake binutils
      # OFFICE
      texlive.combined.scheme-medium typora wpsoffice
      # DEFAULT
      discord vlc spotify gimp tor-browser-bundle-bin
      # GAMES
      bastet multimc tigervnc
    ];

    programs = {
      home-manager.enable = true;
      command-not-found.enable = true;
      firefox.enable = true;
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

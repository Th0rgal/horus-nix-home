{ config, pkgs, lib, ... }:

with pkgs;
let
  default-python = python3.withPackages (python-packages: with python-packages; [
    (callPackage ./pylibs/binancepy.nix { }) (callPackage ./pylibs/bit.nix { })
    # basics
    pip faker pywal black setuptools wheel twine flake8 virtualenv pudb
    # utils
    aioconsole aiohttp
    # school
    pygame pillow
  ]);

in
  {
    imports = [ ./i3.nix ./polybar.nix ./rofi.nix ./alacritty.nix ./compton.nix ];
    nixpkgs.config.allowUnfree = true;

    home.keyboard.layout = "fr";

    # to keep discord up to date
    nixpkgs.overlays = [
      (self: super: {
        discord = super.discord.overrideAttrs (_: {
          src = builtins.fetchTarball https://discord.com/api/download?platform=linux&format=tar.gz;
        });
      })
    ];

    home.packages = with pkgs; [
      # MISC
      arandr haskellPackages.network-manager-tui
      # TERMINAL
      gotop htop neofetch cava zip unrar unzip xorg.xev escrotum tree gnupg
      aria2 imagemagick feh httpie
      # DEVELOPMENT
      (callPackage ./termius.nix { }) idea.idea-ultimate  postman
      default-python conda zulu8 gradle rustup gcc m4 gnumake binutils
      gdb jedit sfml
      # BLOCKCHAIN
      ledger-live-desktop
      # OFFICE
      texlive.combined.scheme-medium wpsoffice typora brave libreoffice-fresh (callPackage ./todoist.nix { })
      # DEFAULT
      kotatogram-desktop discord vlc spotify gimp blueman wineWowPackages.stable obs-studio
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

{ config, pkgs, lib, ... }:

with pkgs;
let
  default-python = python3.withPackages (python-packages: with python-packages; [
    (callPackage ./pylibs/binancepy.nix { }) (callPackage ./pylibs/bit.nix { })
    # basics
    pip faker pywal black setuptools wheel twine flake8 virtualenv pudb
    # utils
    aioconsole aiohttp matplotlib
    # school
    pygame pillow
  ]);

in
  {
    imports = [ ./packages/configs/i3.nix ./packages/configs/polybar.nix ./packages/configs/rofi.nix ./packages/configs/alacritty.nix ./packages/configs/compton.nix ];
    nixpkgs.config.allowUnfree = true;

    home.keyboard.layout = "fr";

    # to keep discord up to date
    nixpkgs.overlays = [
      (self: super: {
        discord = super.discord.overrideAttrs (_: {
          src = builtins.fetchTarball https://discord.com/api/download?platform=linux&format=tar.gz;
        });
      })
      (self: super: {
      neofetch = super.neofetch.overrideAttrs (oldAttrs: {
          src = builtins.fetchTarball "https://github.com/dylanaraps/neofetch/archive/master.tar.gz";
        });
      })
    ];

    home.packages = with pkgs; [
      # MISC
      arandr haskellPackages.network-manager-tui barrier ffmpeg-full
      # TERMINAL
      gotop htop neofetch cava zip unrar unzip xorg.xev escrotum tree gnupg
      aria2 imagemagick feh httpie
      # DEVELOPMENT
      idea.idea-ultimate postman
      default-python conda adoptopenjdk-openj9-bin-8 gradle rustup gcc m4 gnumake binutils
      gdb sfml (callPackage ./packages/termius.nix { }) traceroute
      # BLOCKCHAIN
      (callPackage ./packages/ledgerlive.nix { })
      # OFFICE
      texlive.combined.scheme-medium wpsoffice typora zathura brave libreoffice-fresh
      # DEFAULT
      kotatogram-desktop discord element-desktop vlc spotify gimp blueman wineWowPackages.stable obs-studio
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
            src = lib.cleanSource ./packages/configs/p10k-config;
            file = "p10k.zsh";
          }
        ];
      };
    };

    xsession.enable = true;
  }

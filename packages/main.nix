{ pkgs, ... }:

with pkgs;
let
  default-python = python3.withPackages (python-packages:
    with python-packages; [
      (callPackage ./pylibs/binancepy.nix { })
      (callPackage ./pylibs/bit.nix { })
      # basics
      pip
      faker
      pywal
      black
      flake8
      setuptools
      wheel
      twine
      flake8
      virtualenv
      pudb
      # utils
      aioconsole
      aiohttp
      matplotlib
      pyjwt
      # school
      ipython
      librosa
      ipykernel
      pandas
      seaborn
      sklearn-deap
      jinja2
      #pytorch
      cython
      #(callPackage ./pylibs/qgrid.nix { })
    ]);

in {
  home.packages = with pkgs; [
    # MISC
    cachix
    appimage-run
    appimagekit
    arandr
    haskellPackages.network-manager-tui
    tmate

    # TERMINAL
    any-nix-shell
    gotop
    htop
    neofetch
    cava
    zip
    unrar
    unzip
    xorg.xev
    escrotum
    tree
    gnupg
    aria2
    imagemagick
    feh
    httpie

    # DEVELOPMENT
    idea.idea-ultimate
    postman
    elan
    nixfmt
    default-python
    conda
    adoptopenjdk-openj9-bin-8
    gradle
    gcc
    m4
    gnumake
    binutils
    gdb
    rustup
    ffmpeg # librosa

    # SYSADMIN
    tigervnc
    (callPackage ./termius.nix { })

    # BLOCKCHAIN
    (callPackage ./crypto-org-wallet.nix { })
    (callPackage ./ledgerlive.nix { })
    monero-gui

    # OFFICE
    texlive.combined.scheme-medium
    typora
    wpsoffice
    brave
    libreoffice-fresh
    pavucontrol

    # DEFAULT
    kotatogram-desktop
    discord
    element-desktop
    vlc
    spotify
    blueman
    wineWowPackages.stable
    obs-studio

    # GAMES
    multimc
    flashplayer-standalone
  ];

}

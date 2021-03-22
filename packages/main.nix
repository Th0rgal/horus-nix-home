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
      ipykernel
      pandas
      pytorch
      cython
      (callPackage ./pylibs/qgrid.nix { })
    ]);

in {
  home.packages = with pkgs; [
    # MISC
    cachix
    appimage-run
    arandr
    haskellPackages.network-manager-tui
    barrier
    ffmpeg-full
    tmate
    hping
    ncat
    flashplayer-standalone
    # TERMINAL
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
    sfml
    (callPackage ./termius.nix { })
    rustup
    # BLOCKCHAIN
    (callPackage ./ledgerlive.nix { })
    go-ethereum
    # OFFICE
    texlive.combined.scheme-medium
    wpsoffice
    typora
    zathura
    brave
    libreoffice-fresh
    pavucontrol
    # DEFAULT
    kotatogram-desktop
    discord
    element-desktop
    vlc
    spotify
    gimp
    blueman
    wineWowPackages.stable
    obs-studio
    # GAMES
    bastet
    multimc
    tigervnc
  ];

}

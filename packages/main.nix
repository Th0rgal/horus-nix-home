{ pkgs, ... }:

with pkgs;
let
  default-python = python3.withPackages (python-packages:
    with python-packages; [
      pip
      black
      flake8
      setuptools
      wheel
      twine
      flake8
      virtualenv
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
    escrotum
    tree
    gnupg
    aria2
    imagemagick
    feh

    # DEVELOPMENT
    idea.idea-ultimate
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
    todoist-electron
    libreoffice-fresh
    brave

    # DEFAULT
    pavucontrol
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
  ];

}

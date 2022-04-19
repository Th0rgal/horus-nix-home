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
    appimage-run
    appimagekit
    arandr
    haskellPackages.network-manager-tui
    tmate

    # TERMINAL
    any-nix-shell
    neofetch
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
    adoptopenjdk-hotspot-bin-16
    gradle
    gcc
    m4
    gnumake
    binutils
    gdb
    rustup

    # SYSADMIN
    termius
    remmina

    # BLOCKCHAIN
    (callPackage ./crypto-org-wallet.nix { })
    ledger-live-desktop # (callPackage ./ledgerlive.nix { })
    #(callPackage ./ganache.nix { })
    monero-gui

    # OFFICE
    texlive.combined.scheme-medium
    todoist-electron
    brave

    # DEFAULT
    pavucontrol
    kotatogram-desktop
    signal-desktop
    discord
    vlc
    #spotify
    blueman
    wineWowPackages.stable

    # GAMES
    minecraft
  ];

}

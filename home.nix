{ config, pkgs, lib, ... }:

{
  imports = [
      ./configs/main.nix
      ./packages/main.nix
    ];
  nixpkgs.overlays = [ (import ./overlays/main.nix) ];
  home.keyboard.layout = "fr";
}

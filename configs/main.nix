{ config, pkgs, lib, ... }:

{
  imports = [
    ./alacritty.nix
    ./compton.nix
    ./i3.nix
    ./polybar.nix
    ./redshift.nix
    ./rofi.nix
    ./vscode.nix
  ];

  programs = {
    home-manager.enable = true;
    command-not-found.enable = true;
    git = {
      enable = true;
      userName = "Thomas Marchand";
      userEmail = "me" + "@" + "thomas-marchand.com";
      signing = {
        key = "937F956B9008A22F";
        signByDefault = true;
      };
    };

    zsh = {
      enable = true;
      initExtraFirst = ''
        [ ! -d "$HOME/.zsh/fsh/" ] && mkdir $HOME/.zsh/fsh/
        export FAST_WORK_DIR=$HOME/.zsh/fsh/;
        export PATH=$PATH:~/tools
        export PATH=$PATH:~/.npm-global/bin
        export PATH="$PATH:/home/thomas/.protostar/dist/protostar"
      '';
      plugins = [
        {
          name = "zsh-autosuggestions";
          src = pkgs.fetchFromGitHub {
            owner = "zsh-users";
            repo = "zsh-autosuggestions";
            rev = "v0.6.4";
            sha256 = "0h52p2waggzfshvy1wvhj4hf06fmzd44bv6j18k3l9rcx6aixzn6";
          };
        }
        {
          name = "fast-syntax-highlighting";
          src = pkgs.fetchFromGitHub {
            owner = "zdharma";
            repo = "fast-syntax-highlighting";
            rev = "v1.55";
            sha256 = "0h7f27gz586xxw7cc0wyiv3bx0x3qih2wwh05ad85bh2h834ar8d";
          };
        }
        {
          name = "powerlevel10k";
          src = pkgs.zsh-powerlevel10k;
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }
        {
          name = "powerlevel10k-config";
          src = lib.cleanSource ./p10k-config;
          file = "p10k.zsh";
        }
      ];
    };
  };

  xsession.enable = true;

}

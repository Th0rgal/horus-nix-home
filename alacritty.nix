{ pkgs, ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      window = {
        title = "Terminal";
        dimensions = {
          lines = 75;
          columns = 100;
        };
      };

      font = {
        normal.family = "FuraCode Nerd Font";
        size = 8.0;
      };

      background_opacity = 0.7;

      shell = {
        program = "${pkgs.zsh}/bin/zsh";
        args = ["-c" "echo; neofetch; echo; zsh"];
      };

      colors = {
        primary = {
          background = "0x000000";
          foreground = "0xEBEBEB";
        };
        cursor = {
          text   = "0xFF261E";
          cursor = "0xFF261E";
        };
        normal = {
          black   = "0x040404";
          red     = "0x54534d";
          green   = "0x704f2d";
          yellow  = "0x706451";
          blue    = "0x7d7360";
          magenta = "0xb09063";
          cyan    = "0x5b656b";
          white   = "0xc6c5c0";
        };
        bright = {
          black   = "0x040404";
          red     = "0x696860";
          green   = "0x886138";
          yellow  = "0x877861";
          blue    = "0x948974";
          magenta = "0xCCA773";
          cyan    = "0x737F86";
          white   = "0xc6c5c0";
        };
      };
    };
  };
}
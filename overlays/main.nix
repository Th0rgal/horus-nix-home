self: super: {
  neofetch = super.neofetch.overrideAttrs (oldAttrs: {
          src = builtins.fetchTarball "https://github.com/dylanaraps/neofetch/archive/master.tar.gz";
        });
  discord = super.discord.overrideAttrs (_: {
          src = builtins.fetchTarball https://discord.com/api/download?platform=linux&format=tar.gz;
        });
}
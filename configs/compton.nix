# credits: @LightDiscord who helped me to update to picom
{ pkgs, ... }:

{
  services.picom = {
    enable = true;
    package = pkgs.callPackage ../packages/compton-unstable.nix { };
    experimentalBackends = true;

    blur = true;
    blurExclude = [ "window_type = 'dock'" "window_type = 'desktop'" ];

    fade = true;
    fadeDelta = 5;

    shadow = true;
    shadowOffsets = [ (-7) (-7) ];
    shadowOpacity = "0.7";
    shadowExclude = [ "window_type *= 'normal' && ! name ~= ''" ];
    noDockShadow = true;
    noDNDShadow = true;

    activeOpacity = "1.0";
    inactiveOpacity = "0.8";
    menuOpacity = "0.8";

    backend = "glx";
    vSync = true;

    extraOptions = ''
      shadow-radius = 7;
      clear-shadow = true;
      frame-opacity = 0.7;
      blur-method = "dual_kawase";
      blur-strength = 5;
      alpha-step = 0.06;
      detect-client-opacity = true;
      detect-rounded-corners = true;
      paint-on-overlay = true;
      detect-transient = true;
      mark-wmwin-focused = true;
      mark-ovredir-focused = true;
    '';
  };
}

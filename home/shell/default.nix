{config, ...}: let
  d = config.xdg.dataHome;
  c = config.xdg.configHome;
  cache = config.xdg.cacheHome;
in {
  imports = [
    ./starship.nix
    ./common.nix
    ./bash.nix
    ./alacritty.nix
  ];

  home.sessionVariables = {
    # clean up
    LESSHISTFILE = cache + "/less/history";
    LESSKEY = c + "/less/lesskey";
    WINEPREFIX = d + "/wine";

    # defaults
    EDITOR = "nvim";
    BROWSER = "firefox";
  };
}

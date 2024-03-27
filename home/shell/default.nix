{ config, ... }: let
  d = config.xdg.dataHome;
  c = config.xdg.configHome;
  cache = config.xdg.cacheHome;
in {
  imports = [
    ./terminals.nix
    ./starship.nix
    ./common.nix
    ./bash.nix
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

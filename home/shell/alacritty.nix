{pkgs, ...}: let
  font = "JetBrainsMono Nerd Font";
in {
  programs.alacritty = {
    enable = true;
    settings = {
      window.dynamic_padding = true;
      window.padding = {
        x = 5;
        y = 5;
      };
      window.dimensions = {
        columns = 160;
        lines = 35;
      };
      scrolling.history = 10000;
      font = {
        normal.family = font;
        bold.family = font;
        italic.family = font;
        size = 14;
      };
    };
  };
}

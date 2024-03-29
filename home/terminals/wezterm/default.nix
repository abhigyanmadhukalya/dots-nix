{pkgs, ...}: {
  home.packages = with pkgs; [wezterm];
  programs.wezterm = {
    enable = true;
  };
  xdg.configFile."wezterm/wezterm.lua".source = ./wezterm.lua;
}

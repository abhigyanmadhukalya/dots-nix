{
  config,
  pkgs,
  ...
}: {
  dconf = {
    enable = true;
    settings = {
      "org/gnome/mutter".center-new-windows = true;
      "org/gnome/desktop/interface".color-scheme = "prefer-dark";
    };
  };
}

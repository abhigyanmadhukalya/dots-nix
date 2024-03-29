{pkgs, ...}: {
  home.packages = with pkgs; [
    vscode
    firefox
    keepassxc
    gnome.gnome-tweaks
    adw-gtk3
    gnomeExtensions.gsconnect
  ];
}

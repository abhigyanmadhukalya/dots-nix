{pkgs, ...}: {
  home.packages = with pkgs; [
    vscode
    firefox
    brave
    keepassxc
    gnome.gnome-tweaks
    adw-gtk3
    gnomeExtensions.gsconnect
    discord
    steam
    thunderbird
  ];
}

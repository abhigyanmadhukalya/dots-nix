{pkgs, ...}: {
  home.packages = with pkgs; [
    vscode
    firefox
    brave
    steam
  ];
}

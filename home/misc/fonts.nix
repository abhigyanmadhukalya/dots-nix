{pkgs, ...}: {
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    (nerdfonts.override {fonts = ["JetBrainsMono" "Noto"];})
    source-han-code-jp
    source-han-sans
    source-han-mono
    source-han-serif
    fira-code
    roboto-mono
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
  ];
}

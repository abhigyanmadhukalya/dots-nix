{
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    neofetch

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep
    jq
    yq-go
    eza
    fzf
    stow

    # networking tools
    mtr
    aria2
    nmap
    dnsutils

    # misc
    file
    which
    tree
    gnutar
    zstd
    gnupg
    gnused

    # nix-reladted
    nix-output-monitor

    # sys tools
    lm_sensors
    pciutils
    usbutils
    duf
    inxi
  ];
}

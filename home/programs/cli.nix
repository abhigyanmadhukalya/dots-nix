{pkgs, ...}: {
  home.packages = with pkgs; [
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
    lf
    bat
    direnv
    btop
    nitch
    transmission
    wl-clipboard

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
    alejandra
    deadnix
    statix

    # sys tools
    lm_sensors
    pciutils
    usbutils
    duf
    inxi
  ];
}

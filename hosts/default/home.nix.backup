{ config, pkgs, ... }:

{
  home.username = "abhigyan";
  home.homeDirectory = "/home/abhigyan";

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
  ];

  programs.git = {
    enable = true;
    userName = "Abhigyan Madhukalya";
    userEmail = "amadhukalya2005@gmail.com";
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      font = {
        size = 12;
	draw_bold_text_with_bright_colors = true;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';
    shellAliases = {
      vim = "nvim";
      btop = "btop --utf-force";
      ls = "eza --long --header --git --all --icons=always";
      ll = "eza -l -h --icons=always";
      g = "git";
    };
  };


  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}

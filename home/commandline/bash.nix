{...}: {
  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
      export EDITOR="nvim"
      export DIRENV_LOG_FORMAT=""
    '';
    shellAliases = {
      vim = "nvim";
      btop = "btop --utf-force";
      ls = "eza --long --header --git --all --icons=always";
      ll = "eza -l -h --icons=always";
      g = "git";
      nixr = "sudo nixos-rebuild switch --flake ~/.dotfiles#default";
    };
    initExtra = ''
      cya() {
       systemctl poweroff
      }
    '';
  };
}

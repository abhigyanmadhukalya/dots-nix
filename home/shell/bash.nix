{ config, ... }: {
  programs.bash = {
    enable = true;
    enableCompletion = true;
    basrcExtra = ''
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
}

{pkgs, ...}: {
  home.packages = with pkgs; [gh git];

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };

  programs.git = {
    enable = true;

    userName = "Abhigyan Madhukalya";
    userEmail = "amadhukalya2005@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
      branch.sort = "-committerdate";
      core.editor = "nvim";
      pull.ff = "only";
    };

    delta = {
      enable = true;
      options = {
        features = "side-by-side line-numbers";
        syntax-theme = "gruvbox-dark";
        delta.navigate = true;
      };
    };
  };

  xdg.configFile."git/ignore".text = ''
    .direnv
  '';
}

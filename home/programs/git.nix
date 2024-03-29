{pkgs, ...}:
with builtins; let
  DEFAULT_BRANCH = "main";
  DEFAULT_BRANCH_OLD = "master";
  DEVELOP_BRANCH = "develop";
  DEVELOP_BRANCH_ABBREV = "dev";

  PROTECTED_BRANCHE_LIST = [DEFAULT_BRANCH DEFAULT_BRANCH_OLD DEVELOP_BRANCH DEVELOP_BRANCH_ABBREV];
  PROTECTED_BRANCHES_STR = concatStringsSep "|" PROTECTED_BRANCHE_LIST;
in {
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
      init.defaultBranch = DEFAULT_BRANCH;
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

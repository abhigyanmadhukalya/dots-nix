{ config, ... }: {
  home.sessionVariables.STARSHIP_CACHE = "${config.xdg.cacheHome}/starship";
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };
}

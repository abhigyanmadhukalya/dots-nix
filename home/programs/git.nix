{ pkgs, ... }: {
  home.packages - [pkgs.gh];

  programs.git = {
    enable = true;
    userName = "Abhigyan Madhukalya";
    userEmail = "amadhukalya2005@gmail.com";
  };
}

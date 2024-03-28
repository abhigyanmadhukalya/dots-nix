{pkgs, ...}: {
  home.packages = with pkgs; [gh git];

  programs.git = {
    enable = true;
    userName = "Abhigyan Madhukalya";
    userEmail = "amadhukalya2005@gmail.com";
  };
}

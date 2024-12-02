{...}: {
  imports = [
    ./programs
    ./misc
    ./commandline
  ];

  home = {
    username = "abhigyan";
    homeDirectory = "/home/abhigyan";

    stateVersion = "24.11";
  };
  programs.home-manager.enable = true;
}

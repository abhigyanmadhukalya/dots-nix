{...}: {
  imports = [
    ./programs
    ./misc
    ./commandline
    ./hyprland
  ];

  home = {
    username = "abhigyan";
    homeDirectory = "/home/abhigyan";

    stateVersion = "24.11";
  };
  programs.home-manager.enable = true;
}

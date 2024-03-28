{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./programs
  ];

  home = {
    username = "abhigyan";
    homeDirectory = "/home/abhigyan";

    stateVersion = "23.11";
  };
  programs.home-manager.enable = true;
}

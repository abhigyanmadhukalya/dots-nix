{pkgs, ...}: {
  services = {
    # Enable fstrim timer for SSDs
    fstrim.enable = true;

    # Enable the OpenSSH daemon.
    openssh = {
      enable = false;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
      };
      openFirewall = true;
    };

    # Syncthing
    syncthing = {
      enable = true;
      user = "abhigyan";
      dataDir = "/home/abhigyan/Documents";
      configDir = "/home/abhigyan/.config/syncthing";
    };

    # Flatpak support
    flatpak.enable = true;

    # Thermald for laptop
    thermald.enable = true;

    # Enable MySQL
    mysql = {
      enable = true;
      package = pkgs.mariadb;
    };

    auto-cpufreq = {
      enable = true;
      settings = {
        battery = {
          governor = "powersave";
          turbo = "never";
        };
        charger = {
          governor = "performance";
          turbo = "auto";
        };
      };
    };
  };
}

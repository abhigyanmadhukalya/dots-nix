{pkgs, ...}: {
  services = {
    # Enable fstrim timer for SSDs
    fstrim.enable = true;

    # Enable the OpenSSH daemon.
    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
      };
      openFirewall = true;
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
      enable = false;
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

{
  config,
  pkgs,
  ...
}: {
  # Enable fstrim timer for SSDs
  services.fstrim.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
    openFirewall = true;
  };

  # Syncthing
  services.syncthing = {
    enable = true;
    user = "abhigyan";
    dataDir = "/home/abhigyan/Documents";
    configDir = "/home/abhigyan/.config/syncthing";
  };

  # Flatpak support
  services.flatpak.enable = true;

  # Thermald for laptop
  services.thermald.enable = true;

  services.auto-cpufreq.enable = true;
  services.auto-cpufreq.settings = {
    battery = {
      governor = "powersave";
      turbo = "never";
    };
    charger = {
      governor = "performance";
      turbo = "auto";
    };
  };
}

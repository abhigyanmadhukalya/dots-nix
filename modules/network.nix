{...}: {
  # Firewall
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [8384 22000];
    allowedUDPPorts = [22000 21027];
  };
}

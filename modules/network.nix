{config, pkgs, ...}:
{
  # Firewall
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [8384 22000];
  networking.firewall.allowedUDPPorts = [22000 21027];
}
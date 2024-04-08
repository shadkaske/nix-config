{ config, pkgs, ... }:
{
  # Qemu and Spice Agent
  environment.systemPackages = [
    pkgs.spice-vdagent
  ];
  services.spice-vdagentd.enable = true;
  services.qemuGuest.enable = true;
}

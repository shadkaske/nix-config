{ inputs, outputs, lib, config, pkgs, ... }: {
  virtualisation.docker.enable = true;

  environment.systemPackages = [
    pkgs.docker-compose
  ];
}
# vim: ts=2 sw=2 et

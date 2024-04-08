{ pkgs, config, ... }: {
  imports = [
    ./openssh.nix
    ./locale.nix
    ./packages.nix
    ./user.nix
    # TODO:
    # - Libvirt
    # - Docker
    # - firewall
  ];
}
# vim: ts=2 sw=2 et

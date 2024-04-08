{ pkgs, config, ... }: {
  imports = [
    ./services/openssh.nix
    ./services/docker.nix
    ./settings/locale.nix
    ./settings/editor.nix
    ./settings/utilities.nix
    ./settings/user.nix
    # TODO:
    # - Libvirt
    # - Docker
    # - firewall
  ];
}
# vim: ts=2 sw=2 et

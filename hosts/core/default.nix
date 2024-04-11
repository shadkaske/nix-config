{ pkgs, config, ... }: {
  imports = [
    ./settings/locale.nix
    ./settings/editor.nix
    ./settings/utilities.nix
    ./services/openssh.nix
    ./services/docker.nix
    ./services/libvirt.nix
    ./settings/user.nix
    # TODO: firewall
  ];
}
# vim: ts=2 sw=2 et

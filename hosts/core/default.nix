{ pkgs, config, ... }: {
  imports = [
    ./openssh.nix
    ./locale.nix
    ./packages.nix
    ./user.nix
  ];
}
# vim: ts=2 sw=2 et

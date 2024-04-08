{ inputs, outputs, lib, config, pkgs, ... }: {

  # This setups a SSH server. Very important if you're setting up a headless system.
  # Feel free to remove if you don't need it.
  services.openssh = {
    enable = true;
    settings = {
      # Forbid root login through SSH.
      PermitRootLogin = "no";
      # Use keys only. Remove if you want to SSH using password (not recommended)
      # TODO: Get this fixed once we have keys poplulated
      PasswordAuthentication = true;
    };
  };
}
# vim: ts=2 sw=2 et

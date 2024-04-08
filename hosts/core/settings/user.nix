{ pkgs, config, ... }: {
  programs.zsh.enable = true;
  users.users = {
    shadkaske = {
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA/ZSE9QXLIsWkA8TqveQzkN5PiAZUWXFyCFcgHUP3Ao"
      ];
      shell = pkgs.zsh;
      extraGroups = [
        "wheel"
        "audio"
        "video"
        "networkmanager"
        "docker"
        "libvirtd"
      ];
    };
  };
}

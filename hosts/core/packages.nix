{ config, pkgs, ... }:
{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    curl
    fd
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
}

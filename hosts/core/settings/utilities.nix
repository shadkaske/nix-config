{ config, pkgs, ... }:
{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    curl
    fd
    python3
    virtualenv
    gcc
    nodejs_21
    ripgrep
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
}

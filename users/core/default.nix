{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ./zsh.nix
    ./fzf.nix
    ./cli.nix
    ./bat.nix
    ./eza.nix
  ];
}

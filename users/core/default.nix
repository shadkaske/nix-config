{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ./cli/zsh.nix
    ./cli/fzf.nix
    ./cli/cli.nix
    ./cli/bat.nix
    ./cli/eza.nix
    ./cli/tmux.nix
    ./cli/starship.nix
    # TODO: Tmuxinator
    # TODO:neovim
    # TODO:kitty
    # TODO:Different Desktops
  ];
}

{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ./cli/zsh.nix
    ./cli/fzf.nix
    ./cli/cli.nix
    ./cli/bat.nix
    ./cli/eza.nix
    ./cli/tmux.nix
    # TODO:
    # - Starship
    # - Tmux
    # - Tmuxinator
    # - neovim
    # - kitty
    # - Different Desktops
  ];
}

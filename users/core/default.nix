{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ./cli/zsh.nix
    ./cli/fzf.nix
    ./cli/cli.nix
    ./cli/bat.nix
    ./cli/eza.nix
    ./cli/tmux.nix
    ./cli/starship.nix
    ./applications/kitty.nix
    # TODO:neovim
    # TODO:Different Desktops
  ];

  fonts.fontconfig.enable = true;
  home.packages = [
    (pkgs.nerdfonts.override {
      fonts = [ "JetBrainsMono" ];
    })
  ];
}

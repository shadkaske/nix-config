{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ./cli/zsh.nix
    ./cli/fzf.nix
    ./cli/cli.nix
    ./cli/bat.nix
    ./cli/eza.nix
    ./cli/tmux.nix
    ./cli/starship.nix
    ./cli/git.nix
    ./cli/lazygit.nix
    ./applications/kitty.nix
    ./applications/rofi.nix
    ./gnome
    # TODO:neovim
    # TODO:Different Desktops
  ];

  fonts.fontconfig.enable = true;

  home.packages = [
    (pkgs.nerdfonts.override {
      fonts = [ "JetBrainsMono" ];
    })
    pkgs.dconf2nix
  ];
}

{ inputs, outputs, lib, config, pkgs, ... }: {
  home.file."${config.xdg.configHome}/fd/ignore" = {
    text = ''
      !.config
      !.dotfiles
      !.ssh
      !Code
      !Desktop
      !Documents
      !Downloads
      !Music
      !PhpstormProjects
      !Pictures
      .ansible
      .bundle
      .cache
      .docker
      .fzf
      .gnupg
      .java
      .local
      .mozilla
      .npm
      .oh-my-zsh
      .pki
      .steam
      .tmux
      .vagrant.d
      .var
      .vscode
      .yarn
      Public
      Templates
      Videos
      VirtualBox VMs
    '';
  };
}
# vim: ts=2 sw=2 et


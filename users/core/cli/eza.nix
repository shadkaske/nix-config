{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.eza = {
    enable = true;
    extraOptions = [
      "--group-directories-first"
      "--group"
      "--header"
      "--color-scale"
    ];
    git = true;
    icons = true;
  };
}
# vim: ts=2 sw=2 et


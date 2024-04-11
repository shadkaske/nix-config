{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.wofi = {
    enable = true;
    settings = {
      location = "center";
      insensitive = true;
      matching = "fuzzy";
    };
  };
}
# vim: ts=2 sw=2 et

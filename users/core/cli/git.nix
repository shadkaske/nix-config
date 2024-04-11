{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.git = {
    enable = true;
    lfs.enable = true;
    userEmail = "shadkaske@gmail.com";
    userName = "Shad Kaske";
  };

  home.packages = [
    pkgs.gitflow
  ];
}
# vim: ts=2 sw=2 et


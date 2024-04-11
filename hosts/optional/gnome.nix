{ inputs, outputs, lib, config, pkgs, ... }: {
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
    gnome.cheese
    gnome.geary
  ]) ++ (with pkgs.gnome; [
    gnome-music
    gnome-terminal
    gedit
    evince
    gnome-characters
    totem
  ]);

  environment.systemPackages = with pkgs; [
    papirus-icon-theme
    gnome.adwaita-icon-theme
  ];
}



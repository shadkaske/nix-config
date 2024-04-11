{ inputs, outputs, lib, config, pkgs, ... }: {
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
    gnome.cheese
    gnome.geary
  ]) ++ (with pkgs; [
    gnome.gnome-music
    gnome.gnome-terminal
    gnome.gnome-characters
    gnome.totem
    evince
  ]);

  environment.systemPackages = with pkgs; [
    gnome.adwaita-icon-theme
    sysprof
  ];

  services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];

  services.dbus.packages = with pkgs; [ gnome2.GConf ];

  # Install systemprofiler
  services.sysprof.enable = true;
}



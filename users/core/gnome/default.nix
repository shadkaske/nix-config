{ config, lib, hostname, pkgs, ... }:

with lib.hm.gvariant;

{
  imports = [
    ./settings/dconf.nix
  ];

  dconf.enable = true;

  gtk = {
    enable = true;

    cursorTheme = {
      name = "Adwaita";
      package = pkgs.gnome.adwaita-icon-theme;
      size = 32;
    };

    # font = {
    #   name = "Work Sans 12";
    #   package = pkgs.work-sans;
    # };

    gtk2 = {
      configLocation = "${config.xdg.configHome}/.gtkrc-2.0";
      extraConfig = ''
        gtk-application-prefer-dark-theme = 1
        gtk-decoration-layout = ":minimize,maximize,close"
      '';
    };

    gtk3 = {
      extraConfig = {
        gtk-application-prefer-dark-theme = 1;
        gtk-decoration-layout = ":minimize,maximize,close";
      };
    };

    gtk4 = {
      extraConfig = {
        gtk-application-prefer-dark-theme = 1;
        gtk-decoration-layout = ":minimize,maximize,close";
      };
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.unstable.adw-gtk3;
    };
  };

  home.pointerCursor = {
    name = "Adwaita";
    package = pkgs.gnome.adwaita-icon-theme;
    size = 32;
    gtk.enable = true;
    x11.enable = true;
  };

  services = {
    mpris-proxy.enable = true;
  };
}

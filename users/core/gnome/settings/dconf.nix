# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf = {
    enable = true;
    settings = {
      "org/gnome/Console" = {
        last-window-size = mkTuple [ 652 480 ];
      };

      "org/gnome/Geary" = {
        migrated-config = true;
      };

      "org/gnome/calendar" = {
        active-view = "month";
        window-maximized = true;
        window-size = mkTuple [ 768 600 ];
      };

      "org/gnome/control-center" = {
        last-panel = "keyboard";
        window-state = mkTuple [ 980 640 false ];
      };

      "org/gnome/desktop/app-folders" = {
        folder-children = [ "Utilities" "YaST" "Pardus" ];
      };

      "org/gnome/desktop/app-folders/folders/Pardus" = {
        categories = [ "X-Pardus-Apps" ];
        name = "X-Pardus-Apps.directory";
        translate = true;
      };

      "org/gnome/desktop/app-folders/folders/Utilities" = {
        apps = [ "gnome-abrt.desktop" "gnome-system-log.desktop" "nm-connection-editor.desktop" "org.gnome.baobab.desktop" "org.gnome.Connections.desktop" "org.gnome.DejaDup.desktop" "org.gnome.Dictionary.desktop" "org.gnome.DiskUtility.desktop" "org.gnome.Evince.desktop" "org.gnome.FileRoller.desktop" "org.gnome.fonts.desktop" "org.gnome.Loupe.desktop" "org.gnome.seahorse.Application.desktop" "org.gnome.tweaks.desktop" "org.gnome.Usage.desktop" "vinagre.desktop" ];
        categories = [ "X-GNOME-Utilities" ];
        name = "X-GNOME-Utilities.directory";
        translate = true;
      };

      "org/gnome/desktop/app-folders/folders/YaST" = {
        categories = [ "X-SuSE-YaST" ];
        name = "suse-yast.directory";
        translate = true;
      };

      "org/gnome/desktop/input-sources" = {
        sources = [ (mkTuple [ "xkb" "us" ]) ];
        xkb-options = [ "ctrl:nocaps" ];
      };

      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        cursor-size = 32;
        cursor-theme = "Adwaita";
        enable-hot-corners = false;
        gtk-theme = "adw-gtk3-dark";
        icon-theme = "Adwaita";
      };

      "org/gnome/desktop/notifications" = {
        application-children = [ "org-gnome-console" "gnome-power-panel" "org-gnome-geary" ];
        show-in-lock-screen = false;
      };

      "org/gnome/desktop/notifications/application/gnome-power-panel" = {
        application-id = "gnome-power-panel.desktop";
      };

      "org/gnome/desktop/notifications/application/org-gnome-console" = {
        application-id = "org.gnome.Console.desktop";
      };

      "org/gnome/desktop/notifications/application/org-gnome-geary" = {
        application-id = "org.gnome.Geary.desktop";
      };

      "org/gnome/desktop/peripherals/touchpad" = {
        natural-scroll = false;
        tap-to-click = true;
        two-finger-scrolling-enabled = true;
      };

      "org/gnome/desktop/privacy" = {
        old-files-age = mkUint32 30;
        recent-files-max-age = -1;
      };

      "org/gnome/desktop/search-providers" = {
        sort-order = [ "org.gnome.Contacts.desktop" "org.gnome.Documents.desktop" "org.gnome.Nautilus.desktop" ];
      };

      "org/gnome/desktop/session" = {
        idle-delay = mkUint32 600;
      };

      "org/gnome/desktop/wm/keybindings" = {
        close = [ "<Super>q" ];
      };

      "org/gnome/epiphany" = {
        ask-for-default = false;
      };

      "org/gnome/evolution-data-server" = {
        migrated = true;
      };

      "org/gnome/mutter" = {
        edge-tiling = true;
      };

      "org/gnome/nautilus/preferences" = {
        default-folder-viewer = "icon-view";
        migrated-gtk-settings = true;
        search-filter-time-type = "last_modified";
      };

      "org/gnome/nautilus/window-state" = {
        initial-size = mkTuple [ 890 550 ];
      };

      "org/gnome/settings-daemon/plugins/media-keys" = {
        custom-keybindings = [];
      };

      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        binding = "<Super>Return";
        command = "kitty";
        name = "Kitty";
      };

      "org/gnome/settings-daemon/plugins/power" = {
        sleep-inactive-ac-timeout = 5400;
      };

      "org/gnome/shell" = {
        remember-mount-password = false;
        welcome-dialog-last-shown-version = "45.5";
      };

      "org/gnome/shell/world-clocks" = {
        locations = [];
      };
    };
  };
}

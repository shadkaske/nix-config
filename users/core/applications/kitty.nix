{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.kitty = {
    enable = true;
    theme = "Catppuccin-Mocha";
    font = {
      # package = (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; });
      name = "JetBrainsMono NFM Thin";
      size = 13.0;
    };
    settings = {
      adjust_line_height = "110%";
      background_opacity = "0.9";
      enable_audio_bell = "no";
      copy_on_select = "yes";
      hide_window_decorations = "no";
      remember_window_size = "yes";
      initial_window_width = "124c";
      initial_window_height = "32c";
      placement_strategy = "center";
      strip_trailing_spaces = "smart";
      confirm_os_window_close = "0";
      window_padding_width = "4";
      tab_bar_min_tabs = "2";
      tab_bar_edge = "bottom";
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
      tab_title_template = "{title}{' :{}:'.format(num_windows) if num_windows > 1 else ''}";
      wayland_titlebar_color = "background";
    };
  };
}
# vim: ts=2 sw=2 et

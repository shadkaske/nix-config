{ inputs, outputs, lib, config, pkgs, ... }:
let
  tmux-ssh-split = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "tmux-ssh-split";
    version = "unstable-2024-04-08";
    src = pkgs.fetchFromGitHub {
      owner = "pschmitt";
      repo = "tmux-ssh-split";
      rev = "bccb77fa45077763967978a32dc401767f170248";
      sha256 = "sha256-Z16laz2Xeyg4/eCbS5qqXxLB6xpADvHWKWlfJqLYO/k";
    };
  };
in
{
  programs.tmux = {
    enable = true;
    aggressiveResize = true;
    baseIndex = 1;
    clock24 = true;
    disableConfirmationPrompt = true;
    escapeTime = 0;
    mouse = true;
    prefix = "C-a";
    sensibleOnTop = true;
    shell = "${pkgs.zsh}/bin/zsh";
    tmuxinator.enable = true;
    extraConfig = ''
      set-option -sa terminal-features ',xterm-kitty:RGB'
      set -g detach-on-destroy off
      set -g display-time 750
      set -g monitor-activity off
      set -g visual-activity off
      set -g status-position top
      set-option -g automatic-rename on
      set-option -g automatic-rename-format '#{b:pane_current_path}'
      set-option -g status-interval 1
      is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
          | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
      bind-key -n C-h if-shell "$is_vim" 'send-keys C-h'  'select-pane -L'
      bind-key -n C-j if-shell "$is_vim" 'send-keys C-j'  'select-pane -D'
      bind-key -n C-k if-shell "$is_vim" 'send-keys C-k'  'select-pane -U'
      bind-key -n C-l if-shell "$is_vim" 'send-keys C-l'  'select-pane -R'

      bind-key -n M-h if-shell "$is_vim" 'send-keys M-h' 'resize-pane -L 3'
      bind-key -n M-j if-shell "$is_vim" 'send-keys M-j' 'resize-pane -D 3'
      bind-key -n M-k if-shell "$is_vim" 'send-keys M-k' 'resize-pane -U 3'
      bind-key -n M-l if-shell "$is_vim" 'send-keys M-l' 'resize-pane -R 3'
      bind C-g new-window -c "#{pane_current_path}" -n "LazyGit" lazygit
      bind C-t split-window -h -c "#{pane_current_path}" "artisan tinker"
      bind C-f split-window -h -c "#{pane_current_path}" ranger
      bind C-e new-window -c "#{pane_current_path}" -n "Ranger" ranger
      unbind "'"
      bind "'" last-window
      unbind ";"
      bind ";" switch-client -l
      bind r source-file ${config.xdg.configHome}/tmux/tmux.conf \; display-message "Tmux Config Reloaded ..."
      bind S set status
      bind-key -T copy-mode-vi 'v' send -X begin-selection
      bind-key -T copy-mode-vi 'C-v' send -X begin-selection \; send -X rectangle-toggle
    '';
    plugins = with pkgs; [
      tmuxPlugins.sensible
      tmuxPlugins.yank
      {
        plugin = tmuxPlugins.tmux-fzf;
        extraConfig = ''
          TMUX_FZF_LAUNCH_KEY="f"
          TMUX_FZF_ORDER="session|window|pane|command|keybinding"
          TMUX_FZF_SESSION_FORMAT="#{session_windows} windows"
        '';
      }
      {
        plugin = tmuxPlugins.tilish;
        extraConfig = ''
          set -g @tilish-dmenu 'on'
          set -g @tilish-navigate 'on'
          set -g @tilish-easymode 'on'
          set -g @tilish-default 'tiled'
        '';
      }
      {
        plugin = tmuxPlugins.catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavour 'mocha'
          set -g @catppuccin_window_left_separator ""
          set -g @catppuccin_window_right_separator " "
          set -g @catppuccin_window_middle_separator " █"
          set -g @catppuccin_window_number_position "right"
          set -g @catppuccin_window_default_fill "number"
          set -g @catppuccin_window_default_text "#W"
          set -g @catppuccin_window_current_fill "number"
          set -g @catppuccin_window_current_text "#W"
          set -g @catppuccin_status_modules_right "session"
          set -g @catppuccin_status_left_separator  " "
          set -g @catppuccin_status_right_separator ""
          set -g @catppuccin_status_right_separator_inverse "no"
          set -g @catppuccin_status_fill "icon"
          set -g @catppuccin_status_connect_separator "no"
          set -g @catppuccin_directory_text "#{pane_current_path}"
        '';
      }
      # TODO: Fix the error when loading this plugin
      # {
      #   plugin = tmux-ssh-split;
      #   extraConfig = ''
      #     set-option -g @ssh-split-keep-cwd "true"
      #     set-option -g @ssh-split-keep-remote-cwd "true"
      #     set-option -g @ssh-split-fail "false"
      #     set-option -g @ssh-split-no-env "false"
      #     set-option -g @ssh-split-no-shell "false"
      #     set-option -g @ssh-split-strip-cmd "true"
      #     set-option -g @ssh-split-verbose "true"
      #     set-option -g @ssh-split-debug "false"
      #     set-option -g @ssh-split-h-key "|"
      #     set-option -g @ssh-split-v-key "V"
      #     set-option -g @ssh-split-w-key "C"
      #   '';
      # }
    ];
  };
}
# vim: ts=2 sw=2 et


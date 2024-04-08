{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    changeDirWidgetCommand = "fd --type d --exclude .steam --hidden --follow . $HOME";
    changeDirWidgetOptions = [
      "--border-label='Directory Search'"
    ];
    colors = {
      bg = "#1e1e2e";
      spinner = "#f5e0dc";
      hl = "#f38ba8";
      "bg+" = "#313244";
      fg = "#cdd6f4";
      header = "#f38ba8";
      info = "#cba6f7";
      pointer = "#f5e0dc";
      marker = "#f5e0dc";
      "fg+" = "#cdd6f4";
      prompt = "#cba6f7";
      "hl+" = "#f38ba8";
    };
    defaultCommand = "fd --type file --follow --exclude .steam --hidden --color=always";
    defaultOptions = [
      "--border=rounded"
      "--layout=reverse"
      "--no-info"
      "--height 40%"
      "--ansi"
    ];
    fileWidgetCommand = "fd  --hidden --exclude .steam --follow . $HOME";
    fileWidgetOptions = [
      "--border-label='File Search'"
    ];
    historyWidgetOptions = [
      "--border-label='History Search'"
      "--sort"
    ];
    tmux = {
      enableShellIntegration = true;
      shellIntegrationOptions = [
        "-d 40%"
      ];
    };
  };
}
# vim: ts=2 sw=2 et


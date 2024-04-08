{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    settings = {
      add_newline = true;
      format = lib.concatStrings [
        "$os"
        "$username"
        "$hostname"
        "$directory"
        "$git_branch"
        "$git_state"
        "$git_status"
        "$character"
      ];
      right_format = lib.concatStrings [
        "$python"
      ];
      directory = {
        style = "blue";
        truncation_length = 5;
        truncation_symbol = "...";
        home_symbol = " 󰜥";
        read_only = " ";
        truncate_to_repo = false;
      };
      os = {
        disabled = false;
        symbols = {
          Arch = " ";
          Pop = " ";
          Ubuntu = " ";
          Garuda = " ";
          NixOS = " ";
        };
      };
      character = {
        success_symbol = "[❯](green)";
        error_symbol = "[❯](red)";
        vimcmd_symbol = "[❮](blue)";
      };
      username = {
        format = "[$user]($style)";
      };
      hostname = {
        format = "@[$hostname]($style) ";
        style = "bold dimmed green";
      };
      git_branch = {
        format = "[$symbol$branch ]($style)";
        style = "green";
        symbol = " ";
      };
      git_status =
        {
          format = "[[(*$conflicted$untracked$modified$staged$renamed$deleted)](218)($ahead_behind$stashed)]($style)";
          style = "cyan";
          stashed = "≡";
        };
      git_state = {
        format = "\([$state( $progress_current/$progress_total)]($style)\)";
        style = "yellow";
      };
      python = {
        format = "[$virtualenv]($style) ";
        style = "bright-blue";
      };
      palette = "catppuccin_mocha";
      palettes = {
        catppuccin_mocha = {
          rosewater = "#f5e0dc";
          flamingo = "#f2cdcd";
          pink = "#f5c2e7";
          mauve = "#cba6f7";
          red = "#f38ba8";
          maroon = "#eba0ac";
          peach = "#fab387";
          yellow = "#f9e2af";
          green = "#a6e3a1";
          teal = "#94e2d5";
          sky = "#89dceb";
          sapphire = "#74c7ec";
          blue = "#89b4fa";
          lavender = "#b4befe";
          text = "#cdd6f4";
          subtext1 = "#bac2de";
          subtext0 = "#a6adc8";
          overlay2 = "#9399b2";
          overlay1 = "#7f849c";
          overlay0 = "#6c7086";
          surface2 = "#585b70";
          surface1 = "#45475a";
          surface0 = "#313244";
          base = "#1e1e2e";
          mantle = "#181825";
          crust = "#11111b";
        };
      };
    };
  };
}
# vim: ts=2 sw=2 et



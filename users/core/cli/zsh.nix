{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableVteIntegration = true;
    autocd = true;
    dotDir = ".config/zsh";
    history = {
      expireDuplicatesFirst = true;
      ignoreAllDups = true;
    };
    shellAliases = {
    # TODO: Get the rest of my aliases
      gs = "git status";
      gpl = "git pull";
      ls = "eza";
      l = "eza --git-ignore";
      ll = "eza --all --header --long";
      llm = "eza --all --header --long --sort=modified";
      la = "eza -lbhHigUmuSa";
      lx = "eza -lbhHigUmuSa@";
      lt = "eza --tree";
      tree = "eza --tree";
      cat = "bat";
      lg = "lazygit";
    };
    plugins = [
      {
        name = "artisan";
        src = pkgs.fetchFromGitHub {
          owner = "jessarcher";
          repo = "zsh-artisan";
          rev = "master";
          sha256 = "sha256-CsNItXMH4zGJTiO5tXPU+bC8xB4siuGOv+arQX4VBjU=";
        };
      }
      {
        name = "autoswitch_virtualenv";
        src = pkgs.fetchFromGitHub {
          owner = "MichaelAquilina";
          repo = "zsh-autoswitch-virtualenv";
          rev = "3.7.1";
          sha256 = "sha256-hwg9wDMU2XqJ5FQEwMVVaz0n+xZ8NI82tH9VhLfFRC4=";
        };
      }
      {
        name = "fast-syntax-highlighting";
        src = pkgs.zsh-fast-syntax-highlighting;
        file = "share/zsh/site-functions/fast-syntax-highlighting.plugin.zsh";
      }
      {
        name = "zsh-vi-mode";
        src = pkgs.zsh-vi-mode;
        file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
      }
      {
        name = "zsh-autosuggestions";
        src = pkgs.zsh-autosuggestions;
        file = "share/zsh-autosuggestions/zsh-autosuggestions.zsh";
      }
    ];
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "git-flow"
        "tmux"
        "docker-compose"
        "firewalld"
        "systemd"
        "ssh-agent"
      ];
      extraConfig = ''
        zstyle :omz:plugins:ssh-agent agent-forwarding yes
        zstyle :omz:plugins:ssh-agent identies ~/.ssh/id_ed25519
        zstyle :omz:plugins:ssh-agent quiet yes
        zstyle :omz:plugins:ssh-agent lazy yes
        zstyle ':omz:update' mode disabled
      '';
    };
    localVariables = {
      COMPLETION_WAITING_DOTS = "true";
      ZVM_INIT_MODE = "sourcing";
    };
    envExtra = ''
      export EDITOR=nvim
      if [ -d "$HOME/.tmux/plugins/t-smart-tmux-session-manager/bin" ]; then
          export PATH="$HOME/.tmux/plugins/t-smart-tmux-session-manager/bin:$PATH"
          export T_SESSION_NAME_INCLUDE_PARENT="true"
      fi
      export VIRSH_DEFAULT_CONNECT_URI="qemu:///system"
      export MANROFFOPT="-c"
      export AUTOSWITCH_MESSAGE_FORMAT="Switching to %venv_name   %py_version"
      export LANG=en_US.UTF-8
      export MANPAGER="sh -c 'col -bx | bat -l man -p'"
    '';
    initExtra = ''
      # Functions
      function sailinit() {
          docker run --rm \
            -u "$(id -u):$(id -g)" \
            -v $(pwd):/var/www/html \
            -w /var/www/html \
            laravelsail/php"''${2:=83}"-composer:latest \
            composer install --ignore-platform-reqs
      }

      # Laravel Sail Bits, use sail for it's needs, if composer is needed outside of that use docker image
      : ''${SAIL_ZSH_BIN_PATH:="./vendor/bin/sail"}

      # Enable multiple commands with sail
      function artisan \
               composer \
               node \
               npm \
               npx \
               php \
               yarn {
        if checkForSail; then
          $SAIL_ZSH_BIN_PATH "$0" "$@"
        else
          if [[ "$0" == "composer" ]]; then
              # Direct composer to docker
              export COMPOSER_HOME="$HOME/.config/composer"
              export COMPOSER_CACHE_DIR="$HOME/.cache/composer"
              docker run --rm --interactive --tty \
                --env COMPOSER_HOME \
                --env COMPOSER_CACHE_DIR \
                --volume ''${COMPOSER_HOME:-$HOME/.config/composer}:$COMPOSER_HOME \
                --volume ''${COMPOSER_CACHE_DIR:-$HOME/.cache/composer}:$COMPOSER_CACHE_DIR \
                --volume $(pwd):/var/www/html \
                --workdir="/var/www/html" \
                --user="$(id -u):$(id -g)" \
                "$0" "$@"
          else
              # direct other outside of laravel project to system install
              command "$0" "$@"
          fi
        fi
      }

      checkForSail() {
        if [ -f $SAIL_ZSH_BIN_PATH ]; then
          return 0
        else
          return 1
        fi
      }

      _tmuxinator() {
        local commands projects
        commands=(''${(f)"$(tmuxinator commands zsh)"})
        projects=(''${(f)"$(tmuxinator completions start)"})

        if (( CURRENT == 2 )); then
          _describe -t commands "tmuxinator subcommands" commands
          _describe -t projects "tmuxinator projects" projects
        elif (( CURRENT == 3)); then
          case $words[2] in
            copy|debug|delete|open|start|stop)
              _arguments '*:projects:($projects)'
            ;;
          esac
        fi

        return
      }

      compdef _tmuxinator tmuxinator

      export FAST_WORK_DIR="$HOME/.config/fsh"

      if [[ ! -f "$HOME/.config/fsh/current_theme.zsh" ]]; then
          fast-theme XDG:catppuccin-mocha --quiet
      fi
    '';
  };

  home.file."${config.xdg.configHome}/fsh/catppuccin-mocha.ini" = {
    text = ''
      [base]
      default          = #cdd6f4
      unknown-token    = #f38ba8,bold
      commandseparator = #94e2d5
      redirection      = #94e2d5
      here-string-tri  = #bac2de
      here-string-text = #bac2de
      here-string-var  = #bac2de
      exec-descriptor  = none
      comment          = #6c7086
      correct-subtle   = #b4befe
      incorrect-subtle = #eba0ac
      subtle-separator = none
      subtle-bg        = none
      secondary        =
      recursive-base   = #cdd6f4

      [command-point]
      reserved-word     = #cba6f7
      subcommand        = #74c7ec
      alias             = #89b4fa
      suffix-alias      = #89b4fa
      global-alias      = #89b4fa
      builtin           = #cba6f7
      function          = #89b4fa
      command           = #89b4fa
      precommand        = #cba6f7
      hashed-command    = #89b4fa
      single-sq-bracket = #f9e2af
      double-sq-bracket = #f9e2af
      double-paren      = #a6e3a1

      [paths]
      path          = #f5e0dc
      pathseparator = #f5e0dc
      path-to-dir   = #f5e0dc
      globbing      = #f5c2e7
      globbing-ext  = none

      [brackets]
      paired-bracket  = bold
      bracket-level-1 = #f38ba8
      bracket-level-2 = #f9e2af
      bracket-level-3 = #74c7ec

      [arguments]
      single-hyphen-option   = #94e2d5
      double-hyphen-option   = #94e2d5
      back-quoted-argument   = #94e2d5
      single-quoted-argument = #a6e3a1
      double-quoted-argument = #a6e3a1
      dollar-quoted-argument = #a6e3a1
      optarg-string          = #a6e3a1
      optarg-number          = #fab387

      [in-string]
      back-dollar-quoted-argument           = #fab387
      back-or-dollar-double-quoted-argument = #fab387

      [other]
      variable             = #fab387
      assign               = none
      assign-array-bracket = none
      history-expansion    = none

      [math]
      mathvar = #f5c2e7
      mathnum = #fab387
      matherr = #f38ba8,bold

      [for-loop]
      forvar  = #cdd6f4
      fornum  = #fab387
      foroper = #89b4fa
      forsep  = #89b4fa

      [case]
      case-input       = #fab387
      case-parentheses = #9399b2
      case-condition   = #cba6f7
    '';
  };
}
# vim: ts=2 sw=2 et


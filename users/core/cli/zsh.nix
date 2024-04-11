{ inputs, outputs, lib, config, pkgs, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableVteIntegration = true;
    autocd = true;
    # TODO: Customize highlight colors for zsh syntax
    syntaxHighlighting.enable = true;
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
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.4.0";
          sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
        };
      }
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
        name = "zsh-vi-mode";
        src = pkgs.fetchFromGitHub {
          owner = "jeffreytse";
          repo = "zsh-vi-mode";
          rev = "v0.11.0";
          sha256 = "sha256-xbchXJTFWeABTwq6h4KWLh+EvydDrDzcY9AQVK65RS8=";
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
    ];
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        # TODO: Enable after configuring git
        # "git-flow"
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
    '';
  };
}
# vim: ts=2 sw=2 et


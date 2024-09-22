{ lib, pkgs, ... }:
let
  private = import ./private.nix;
in
{
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);

      permittedInsecurePackages = [
        "electron-25.9.0"
      ];
    };
  };

  programs.git = {
    enable = true;
    aliases = {
      creds = ''
        !f() {
          git config user.name && git config user.email
        }; f
      '';
      maingit = ''
        !f() {
          git config user.name "$PRIMARYNAME" && git config user.email "$PRIMARYMAIL";
        }; f
      '';
      kysgit = ''
        !f() {
          git config user.name "$SECONDARYNAME" && git config user.email "$SECONDARYMAIL";
        }; f
      '';
    };
  };

  programs.zsh = {
    enable = true;
    sessionVariables = {
      DONE = "yes.";
    };
    initExtra = ''
      # If you come from bash you might have to change your $PATH.
      export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$HOME/.config/emacs/bin:$PATH

      # Path to your Oh My Zsh installation.
      export ZSH="$HOME/.oh-my-zsh"

      # import gitconfig
      if [ -f ~/home-manager/.gitprivate ]; then
         source ~/home-manager/.gitprivate
      fi

      ZSH_THEME="robbyrussell"

      plugins=(
        git
        zsh-autosuggestions
        fast-syntax-highlighting
                )

      source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
      source $ZSH/oh-my-zsh.sh

      # export MANPATH="/usr/local/man:$MANPATH"

      # You may need to manually set your language environment
      # export LANG=en_US.UTF-8

      # Preferred editor for local and remote sessions
      # if [[ -n $SSH_CONNECTION ]]; then
      #   export EDITOR='vim'
      # else
      #   export EDITOR='nvim'
      # fi

      # Compilation flags
      # export ARCHFLAGS="-arch $(uname -m)"

      # Example aliases
      # alias zshconfig="mate ~/.zshrc"
      # alias ohmyzsh="mate ~/.oh-my-zsh"
    '';
  };

  home = {
    packages = with pkgs; [
      emacs
      vscode
      jetbrains.idea-community
      firefox
      google-chrome
      obsidian
      remmina
      rofi
      piper
      kitty
      xfce.thunar
      vesktop
      vlc
      droidcam
      spotify
      xfce.ristretto
      libreoffice
      git
      go
      python3
      nodejs
      zig
      zls
      rustup
      corepack
      nasm
      asm-lsp
      gopls
      lua-language-server
      vscode-langservers-extracted
      #svelte-language-server
      typescript
      #typescript-language-server
      tailwindcss-language-server
      pyright
      zsh
      unzip
      zip
      xz
      p7zip
      ripgrep
      jq
      fzf
      cowsay
      file
      which
      tree
      gnumake
      gawk
      strace
      ltrace
      lsof
      pciutils
      usbutils
      dnsutils
      socat
      nmap
      ipcalc
      neofetch
      htop
      gdb
      gef
      gf
      zathura
      qemu
      tmux
      prismlauncher
      jdk17
      ffmpeg
      cmake
      libtool
      lutris
      osu-lazer-bin
    ];

    username = "syk";
    homeDirectory = "/home/syk";

    stateVersion = "23.11";
  };
}

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
      maingit = "!f() { git config user.name \"${private.people.primary.name}\" && git config user.email \"${private.people.primary.mail}\"; }; f";
      kysgit = "!f() { git config user.name \"${private.people.secondary.name}\" && git config user.email \"${private.people.secondary.mail}\"; }; f";
    };
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

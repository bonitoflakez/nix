{ lib, pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      hello
    ];

    username = "syk";
    homeDirectory = "/home/syk";

    stateVersion = "23.11";
  };
}

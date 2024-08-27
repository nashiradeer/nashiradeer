{ config, pkgs, ... }: {
  home.username = "nashiradeer";
  home.homeDirectory = "/home/nashiradeer";

  programs.home-manager.enable = true;

  services.arrpc.enable = true;

  home.stateVersion = "24.05";
}

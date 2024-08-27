{ pkgs, lib, ... }: {
  environment.systemPackages = with pkgs; [
    sbctl
  ];
  
  boot.loader.systemd-boot.enable = lib.mkForce false;

  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/etc/secureboot";
  };
}

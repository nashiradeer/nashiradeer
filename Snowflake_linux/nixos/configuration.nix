{ config, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./localization.nix
    ./networking.nix
    ./nvidia.nix
    ./users.nix
  ];

  nixpkgs.config.allowUnfree = true;
 
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    supportedFilesystems = [ "ntfs" ];
  };

  hardware = {
    bluetooth.enable = true;
    graphics.enable = true;
  };

  security.rtkit.enable = true;

  networking = {
    hostName = "Snowflake";
    firewall = {
      allowedTCPPorts = [ 53317 57621 ];
      allowedUDPPorts = [ 5352 53317 ];
    };
    networkmanager.enable = true;
  };

  services = {
    fwupd.enable = true;
    xserver = {
      enable = true;
      xkb.layout = "us";
      xkb.variant = "alt-intl";
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true; 
  }; 

  environment.systemPackages = with pkgs; [
    ffmpeg-full
    git
    kdePackages.ksshaskpass
    kdePackages.qtstyleplugin-kvantum
    neovim
    wl-clipboard
    xclip 
  ];

  programs = {
    firefox.enable = true;
    ssh = {
      startAgent = true;
      askPassword = "${pkgs.kdePackages.ksshaskpass}/bin/ksshaskpass";
    };
    virt-manager.enable = true;
  };

  virtualisation = {
    docker.enable = true;
    libvirtd = {
      enable = true;
      qemu = { 
        swtpm.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
      };
    };
  };

  environment.variables = {
    SSH_ASKPASS_REQUIRE = "prefer";
  };

  system.stateVersion = "24.05";
}

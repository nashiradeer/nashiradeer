{ config, pkgs, ... }: {
  imports = [
    ./hardware.nix
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
    plymouth.enable = true;
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
      allowedUDPPorts = [ 5353 53317 ];
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
    flatpak.enable = true;
    zerotierone = {
      enable = true;
      joinNetworks = [
        "9f77fc393e7a0327"
      ];
    };
  }; 

  programs = {
    firefox.enable = true;
    nix-ld.enable = true;
    partition-manager.enable = true;
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

  environment = {
    systemPackages = with pkgs; [
      ffmpeg-full
      git
      google-chrome
      kdePackages.discover
      kdePackages.filelight
      kdePackages.ksshaskpass
      kdePackages.qtstyleplugin-kvantum
      neovim
      wl-clipboard 
    ];

    variables = {
      SSH_ASKPASS_REQUIRE = "prefer";
    };
 
    sessionVariables = {
      CHROME_EXECUTABLE = "$(find /nix/store -maxdepth 5 -name google-chrome -path '*-google-chrome-*' -executable -print -quit)";
    };
  };

  system.stateVersion = "24.05";
}

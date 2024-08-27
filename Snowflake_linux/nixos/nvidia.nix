{ ... }: {
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  environment.variables = {
    LIBVA_DRIVER_NAME = "nvidia";
    NVD_BACKEND = "direct"; 
  };

  environment.sessionVariables = {
    MOZ_DISABLE_RDD_SANDBOX = "1";
  };
}

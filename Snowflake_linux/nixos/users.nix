{ pkgs, ... }: {
  users.users.nashiradeer = {
    isNormalUser = true;
    description = "Nashira Deer";
    extraGroups = [ "docker" "libvirtd" "networkmanager" "wheel" "kvm" ];
    packages = with pkgs; [
      android-studio
      audacity
      blender
      brave
      davinci-resolve
      droidcam
      flutter
      gimp
      hunspell
      hunspellDicts.en_US
      hunspellDicts.pt_BR
      inkscape
      joplin-desktop
      kitty
      krita
      libreoffice-qt6
      localsend
      neofetch
      obs-studio
      (retroarch.override {
        cores = with libretro; [
	        desmume
	        pcsx2
	      ];
      })
      telegram-desktop
      thunderbird
      vesktop
      vlc
      vscode
    ];
  };
} 

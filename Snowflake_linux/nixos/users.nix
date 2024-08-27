{ pkgs, ... }: {
  users.users.nashiradeer = {
    isNormalUser = true;
    description = "Nashira Deer";
    extraGroups = [ "docker" "libvirtd" "networkmanager" "wheel" ];
    packages = with pkgs; [
      blender
      brave
      davinci-resolve
      gimp
      google-chrome
      inkscape
      joplin-desktop
      kitty
      krita
      localsend
      neofetch
      telegram-desktop
      thunderbird
      vesktop
      vlc
      vscode
    ];
  };
} 

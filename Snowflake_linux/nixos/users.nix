{ pkgs, ... }: {
  users.users.nashiradeer = {
    isNormalUser = true;
    description = "Nashira Deer";
    extraGroups = [ "docker" "libvirtd" "networkmanager" "wheel" ];
    packages = with pkgs; [
      arrpc
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
      spotify
      telegram-desktop
      thunderbird
      vesktop
      vlc
      vscode
    ];
  };
} 

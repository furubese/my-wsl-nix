{ config, lib, pkgs, ... }:

{
  # Set Locate
  time.timeZone = "Asia/Tokyo";
  i18n.defaultLocale = "ja_JP.UTF-8";
  
  # Package
  environment.systemPackages = with pkgs; [
    grim # screenshot functionality
    slurp # screenshot functionality
    wl-clipboard # wl-copy and wl-paste for copy/paste from stdin / stdout
    mako # notification system developed by swaywm maintainer
    kdePackages.qtsvg # Dolphine FileManager
  ];

  # Yazi
  programs.yazi.enable = true  ;

  # Enable the gnome-keyring secrets vault. 
  # Will be exposed through DBus to programs willing to store secrets.
  services.gnome.gnome-keyring.enable = true;
  
  # Enable Sway
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  # add /etc/x11/xkb
  services.xserver.exportConfiguration = true;

}

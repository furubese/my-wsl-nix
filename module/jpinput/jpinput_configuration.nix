{ config, lib, pkgs, ... }:

{
  # Set Locate
  time.timeZone = "Asia/Tokyo";
  i18n.defaultLocale = "ja_JP.UTF-8";
  
  # inputMethod
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [ 
      #fcitx5-mozc
      fcitx5-mozc-ut
      fcitx5-gtk 
    ];
  };

}

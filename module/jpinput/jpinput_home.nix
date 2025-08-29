{ config, pkgs,  ...}:

{
  home.sessionVariables = {
    LANG = "ja_JP.UTF-8";
    LC_ALL = "ja_JP.UTF-8";
  };
  
  # Fcitx5 Mozc設定
  xdg.configFile."fcitx5".source = ./fcitx5;


}

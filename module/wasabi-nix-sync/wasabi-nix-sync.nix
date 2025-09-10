{ config, pkgs,  ...}:

{
  home.packages = with pkgs; [
    sway
    kitty
    nerd-fonts.hack
    noto-fonts
    firefox
  ];

  home.sessionVariables = {
    LANG = "ja_JP.UTF-8";
    LC_ALL = "ja_JP.UTF-8";
  };
  
  # Sway設定
  xdg.configFile."sway/config".source = ./sway/config;

  # kitty設定
  programs.kitty = {
    enable = true;
    settings = {
      # 透過 (0=透明, 1=不透明)
      background_opacity = "0.9";

      # 背景色
      background = "#1e1e2e";
      foreground = "#cdd6f4";
      cursor = "#f38ba8";

      # 装飾を消す
      hide_window_decorations = "yes";

      scrollback_lines = "10000";
      enable_audio_bell = "no";
    };
  };


}

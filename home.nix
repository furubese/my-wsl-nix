{ config, pkgs,  ...}:

{
  
  home.username = "frse";
  home.homeDirectory = "/home/frse";

  home.packages = with pkgs; [
    neovim
    # starship
    git
    gh
    tmux
    tmuxPlugins.tmux-powerline
    tmuxPlugins.nord
  ];
  
  # Zsh設定
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    # 古いAutoSuggestions設定
    # enableAutosuggestions = true;
    enableCompletion = true;
    dotDir = ".config/zsh";
    
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
      ];
      theme = "robbyrussell";
    };
  };

  # Starship設定
  # programs.starship = {
  #   enable = true;
  # };
  # xdg.configFile."starship.toml".source = ./package/starship/jetpack.toml;

  # tmux設定
  programs.tmux = {
    enable = true;
    # Plugin Settings
    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.nord;
      }
    ];

    extraConfig = ''
      set -g default-terminal "xtmux-256color"
    '';
  };

  # その他アプリ設定
  imports = [
    ./module/jpinput/jpinput_home.nix
    ./module/display/display_home.nix
    ./module/editor/editor_home.nix
    ./module/disk/disk_home.nix
  ];

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}

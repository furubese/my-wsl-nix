# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, ... }:

{
  #imports = [
  #  # include NixOS-WSL modules
  #  <nixos-wsl/modules>
  #];

  wsl.enable = true;
  wsl.defaultUser = "frse";
  wsl.interop.includePath = false;

  # Flakesの有効化
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # パッケージインストール
  environment.systemPackages = with pkgs;[
    wget
    vim
    zsh
    git
    tmux
    # Oh My Zshのほうが使いやすいので無効化。
    # starship
    home-manager
  ];

  # パッケージ設定
  programs.git.enable = true;
  programs.zsh.enable = true;
  programs.tmux.enable = true;
  programs.tmux.clock24 = true;

  # Starshipはいらんなぁ。
  # programs.starship.enable = true;

  # ユーザーセットアップ
  users.users.frse = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ]; # sudo やネットワーク設定に必要なら
    shell = pkgs.zsh;
    hashedPassword = "$6$eq8vfHcH9q.1xDev$Y2aKyNEgTxMTbxEMPy1qe7Od/gorzLVSU1fA1pCAj4c38SeQVPAdL8fwN1sk5ryuSWR.NcJA9el4JmoHP2yxS1";
  };



  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}

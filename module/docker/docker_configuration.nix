{ config, lib, pkgs, ... }:

{
  # # Podman設定
  # environment.systemPackages = with pkgs; [
  #   podman
  # ];
  # users.groups.podman = {
  #   gid = 10;
  #  members = [ "frse" ];
  #};
  #virtualisation.containers.enable = true;
  #virtualisation.podman.enable = true;

  # Dockerの有効化
  virtualisation.docker = {
    enable = true;
  };

  users.users.frse.extraGroups = ["docker"];
}

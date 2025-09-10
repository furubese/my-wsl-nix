{ config, lib, ... }:

{
  # Dockerの有効化
  virtualisation.docker = {
    enable = true;
  };

  users.users.frse.extraGroups = ["docker"];
}

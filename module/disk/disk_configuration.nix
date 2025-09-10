{ config, lib, pkgs, ... }:

let
  pythonEnv = pkgs.python3.withPackages(ps: with ps; [ wsgidav ]);
in
{
  environment.systemPackages = [ pythonEnv ];

  systemd.services.wsgidav = {
    description = "WSGIDAV WebDAV Server";
    wants = [ "network.target" ];
    after = [ "network.target" ];
    serviceConfig = {
      ExecStart = "${pythonEnv}/bin/wsgidav --host=0.0.0.0 --port=8080 --root=/home/frse/webdav  --auth=anonymous";
      Restart = "always";
      User = "frse";
      WorkingDirectory = "/home/frse/webdav";
    };
    wantedBy = [ "multi-user.target" ];
  };

  system.activationScripts.webdavDir = {
    text = ''
      mkdir -p /home/frse/webdav
      chown frse:users /home/frse/webdav
    '';
  };
}

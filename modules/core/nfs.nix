# I don't use Network File System, so this will not be included
{host, ...}: let
  inherit (import ../../hosts${host}/variables.nix) enableNFS;
in {
  services = {
    rpcbind.enable = enableNFS;
    nfs.server.enable = enableNFS;
  };
}

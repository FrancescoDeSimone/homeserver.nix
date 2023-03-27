{ config, pkgs, ... }:

{
  fileSystems."/data" = {
    device = "/dev/sdb1";
    fsType = "ext4";
    options = ["nofail" "defaults" "noatime" "data=writeback" "barrier=0" "nobh" "errors=remount-ro" "commit=100" ];
  };
}

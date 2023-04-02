# schedule.nix
{ config, pkgs, ... }:
{
  services.cron = {
    enable = true;
    systemCronJobs = [
      "*/5 * * * *      root    ~/duckdns/duck.sh >/dev/null 2>&1"
    ];
  };

  system.autoUpgrade = {
    enable = true;
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
}

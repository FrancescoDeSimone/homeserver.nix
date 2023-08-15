# schedule.nix
{ config, pkgs, ... }:
{
  services.cron = {
    enable = true;
    systemCronJobs = [
      "*/1 * * * *	root	/home/desi/duckdns/duck.sh >/dev/null 2>&1"
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

  nix.optimise.automatic = true;
  nix.settings.auto-optimise-store = true;
}

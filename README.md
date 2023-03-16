This repository contains the NixOS configuration file for a homeserver, including packages, services, and system settings. This guide will walk you through applying this configuration to your own NixOS system.
Prerequisites

- NixOS installed on your system
- Git installed on your system

Setup

Clone the repository to your system with 

    git clone git@github.com:FrancescoDeSimone/homeserver.nix.git

Copy the configuration files to your NixOS /etc/nixos directory with 
    
    sudo cp -r homeserver-nixos-config/* /etc/nixos/.

Review and modify the configuration files to match your system requirements. Make sure to remove any sensitive information (e.g., passwords, SSH keys) from the files. Test your configuration with 

    sudo nixos-rebuild test

This command will test your configuration without making any changes to your system.

Apply your configuration with 

    sudo nixos-rebuild switch

This command will apply your configuration and reboot your system.

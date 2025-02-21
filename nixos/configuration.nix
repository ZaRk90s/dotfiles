# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
	imports =
	[ # Include the results of the hardware scan.
	./hardware-configuration.nix
	./packages.nix
	./user.nix
	./desktop.nix
	./network.nix
	];

	# Use the systemd-boot EFI boot loader.
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	# Set your time zone.
	time.timeZone = "Europe/Madrid";

	# Keyboard layout
	console.keyMap = "es";
	services.xserver = {
	    xkb.layout = "es";
	    xkb.variant = "";
	};

	# Making the /etc/hosts file writable
	environment.etc."hosts".mode = "0644";

	system.stateVersion = "24.11"; # Did you read the comment?

}


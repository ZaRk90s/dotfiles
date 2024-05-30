{ config, lib, pkgs, ... }:

{
  imports =
  [ 
  ./hardware-configuration.nix 
  # Networking
  ./network.nix
  # Users import
  ./Users/zark90s.nix
  ./Users/root.nix
  # Terminal import
  ./Terminal/zsh.nix
  ./Terminal/terminal.nix
  # Download packages
  ./download_packages.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Set your timezone
  # time.timeZone = "Europe/Amsterdam";

  # Enable the X11 windowing system.
  services.xserver = {
	enable = true;
	displayManager.lightdm = {
		enable = true;
		};
	windowManager.bspwm.enable = true;
  };

  # Enalbe OpenGL
  hardware.opengl.enable = true;

  # Nvidia Driver for Xorg
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
        # Modesettings is required
  	modesetting.enable = true;
	# Nvidia power Mgmt
	powerManagement.enable = false;
	powerManagement.finegrained = false;

	# This is if you are to use the open source driver version
	open = false;

	# Enable the Nvidia settings menu in GUI
	nvidiaSettings = true;

	# This selects the driver version you want
	package = config.boot.kernelPackages.nvidiaPackages.stable;
 };

  nixpkgs.config.allowUnfree = true;
  services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable touchpad support (enable default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Apply font
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Hack" ]; })
  ];

  system.autoUpgrade.enable = true;

  nix = {
	settings.auto-optimise-store = true;
	gc.automatic = true;
	gc.dates = "weekly";
	gc.options = "--delete-older-than 30d";
  };

  services.openssh.enable = true;

  system.stateVersion = "23.11"; # Did you read the comment?

}


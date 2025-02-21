{ config, pkgs, ... }:

{

	# Enable X11 windowing system
	services.xserver = {
		enable = true;

		# Configure BSPWM
		windowManager.bspwm = {
			enable = true;
			configFile = "/home/zark90s/.config/bspwm/bspwmrc";
			sxhkd.configFile = "/home/zark90s/.config/sxhkd/sxhkdrc";
		};

		# Display manager
		displayManager = {
			lightdm.enable = true;
			defaultSession = "none+bspwm";
		};
	};

}

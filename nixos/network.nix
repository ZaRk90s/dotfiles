{ config, pkgs, ... }:

{

	# Enable networking
	networking = {
		networkmanager.enable = true;
		
		# Change this to your desired hostname 
		hostName = "Wapply";
	};

}

{ config, pkgs, ... }: 

{

	# Define user account
	users.users.zark90s = {
		isNormalUser = true;
		description = "zark90s";
		extraGroups = [ "networkmanager" "wheel" ];
		shell = pkgs.zsh;
	};

	users.users.root = {
		shell = pkgs.zsh;
	};

	# zsh configuration
	programs.zsh = {
		enable = true;
		syntaxHighlighting.enable = true;
		autosuggestions.enable = true;
	};

}

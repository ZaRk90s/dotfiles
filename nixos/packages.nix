{ config, pkgs, ... }:

{

	# Allow unfree packages
	nixpkgs.config.allowUnfree = true;

	# System packages
	environment.systemPackages = with pkgs; [
		# Basic utilities
		neovim
		git
		wget
		curl
		lsd
		bat
		openvpn
		tree
		inetutils
		netcat
    zip
    unzip

		# Development tools
		gcc
    clang-tools
		python3
		nodejs
		zig
		go

		# Hacking tools
		nmap
		wireshark
		# metasploit
		burpsuite
		# sqlmap
		tshark
		john
		hashcat
		gobuster
		wfuzz
		aircrack-ng
		ghidra
        tcpdump
        arp-scan

		# Window manager and related
		bspwm
		sxhkd
		rofi
		polybar
		kitty
		feh
		picom

		# Additional utilities
		firefox
    hyperfine
    openssl
    xclip
	];

    fonts.packages = with pkgs; [
        (nerdfonts.override { fonts = [ "Hack" ]; })
    ];

}

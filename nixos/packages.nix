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
		wireshark
		# metasploit
		burpsuite
		# sqlmap
		tshark
		john
		hashcat
		aircrack-ng
		ghidra
		tcpdump
		arp-scan

		# (Hacking) Enumeration tools
		nmap
		wfuzz
		gobuster
		whois
		theharvester
		dnsrecon

		# (Hacking) Dictionaries
		seclists
		rockyou

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

		# Packages
		(python3.withPackages (ps: with ps; [
			numpy
			pandas
			requests
			scapy
			scipy
		]))
	];

    fonts.packages = with pkgs; [
        (nerdfonts.override { fonts = [ "Hack" ]; })
    ];

}

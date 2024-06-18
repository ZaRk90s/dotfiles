# ZaRk90s's Arch Linux

## RECOMENDATION

AFTER INSTALLATION PLEASE READ THE FOLLOWING

*ALL THE FILES IN THIS REPOSITORY MAYBE CAN BE MODIFIED BY ME. BECAUSE I'M DOING TEST ALL THE TIME.*

This repository for my Arch Linux configuration. You can clone it and use it as base for your own configuration. I not recommend you to do this, because you don't will learn, I recommend you to take some ideas for your configuration.

In this repository you will have also the NixOS configuration which I was using, if you want to take some ideas or something like that you can do it.

My configuration is oriented to my needs (Hacking and Programming). I told you this to take it account.

## INSTALLATION

```bash
	cd ~/Downloads
	git clone https://github.com/ZaRk90s/dotfiles
	cd dotfiles
	rm -r nixos # if you don't need the NixOS configuration
```

## CONFIGURATION

Remember replace you main configuration of mine. Before you apply all this things, take a look all to your configuration, maybe you have something which I don't have it or some script.

```bash
	rm -r ~/.config/bspwm
	cp ./bspwm ~/.config
	
	# Do the same thing with all the other file configurations

	rm -r ~/.config/sxhkd
	cp ./sxhkd ~/.config
```

Obiusly if you need to change somthing, CHANGE IT, no problem.


#!/bin/bash

# Handler ctrl + c
function ctrl_c() {
    
    echo -e "\n[!] Exiting from the program...\n"
    tput cnorm; exit 1
}

trap ctrl_c INT

function helpPanel() {
    echo -e "\n[+] Usage: $0 -u <your username>"
}

function configuration() {
    # Download packages
    apt install zsh mono-devel bspwm sxhkd polybar feh rofi jq clangd exploitdb snmp exiftool steghide html2text radare2 lsd bat neovim
    
    # Tip: Becarefull if you have ARM Architecture when you download kitty terminal
    # apt install kitty
    
    # Download Hack Nerd Font
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Hack.zip; mv Hack.zip /usr/share/fonts
    unzip /usr/share/fonts/Hack.zip
    rm -r /usr/share/fonts/Hack.zip

    # Download dotfiles from ZaRk90s
    git clone https://github.com/zark90s/dotfiles; mv dotfiles/{bin,bspwm,kitty,nvim,polybar,sxhkd} /home/$username/.config; mv dotfiles/{.p10k.zsh,zshrc} /home/$username
    rm -r dotfiles

    # Download powerlevel10k
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

    # Change zark90s for your username in the files
    grep -ri "$username" /home/$username/.config | grep -vE "nvim|xfce4|gtk-3.0|ghidra|qterminal.org" | cut -d: -f1 | uniq | xargs -d '\n' -I{} sed -i "s/zark90s/$username/g" "{}"

    # Attention
    echo "\n[+] Things you have to change manually:"
    echo "\n\t1. /home/$username/.config/sxhkd/sxhkdrc location of the terminal"
    echo "\n\t2. /home/$username/.config/bspwm/bspwmrc location of the wallpapers"

    echo "\n\n[++] Already installed all correctly. Change to BSPWM ;)\n\n"
}

if [ "$(echo $UID)" -eq 0 ]; then
    declare -i parameter_counter=0; while getopts "u:h" arg; do
        case $arg in
            u) username=$OPTARG; let parameter_counter+=1;;
            h) helpPanel;;
        esac
    done

    if [ $parameter_counter -ne 1 ]; then
        helpPanel
    else
        configuration
        tput cnorm
    fi
else
    echo -e "\n[!] It is necessary to run the program as root\n"
    exit 1
fi

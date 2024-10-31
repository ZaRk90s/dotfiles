# ZaRk90s's dotfiles
---
Your dotfiles are how you personalize your system. These are mine.

In my case I'm using a virtual machine with Kali Linux.

> [!WARNING]
> Maybe you will need to adapt my configuration to your distribution, dependencies, etc.. Take this in count.

## Requirements
---
- Neovim >= 0.9.5
- Git >= 2.45.2
- a [Hack Nerd Font](https://www.nerdfonts.com/font-downloads) (_optional, but needed to display some icons_ and the font which I use is [Hack Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.zip)
- a terminal (I use [Kitty](https://sw.kovidgoyal.net/kitty/))
- bspwm and sxhkd `sudo apt install bspwm sxhkd` 
- zsh >= 5.9


## Installation
--
Run this:

```bash
mkdir ~/.config 
cd ~/.config
git clone https://github.com/ZaRk90s/dotfiles
cd dotfiles
cp * ../
cd ..
rm -r dotfiles
```



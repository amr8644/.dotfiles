#!/bin/bash

sudo pacman -Syu
sudo pacman -S cowsay
sudo pacman -S wget

# Dev enviroment
echo "Installing Dev enviroment" | cowsay 
sudo pacman -S tmux neovim  zsh neofetch
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone --depth 1 https://github.com/wbthomason/packer.nvim\ ~/.local/share/nvim/site/pack/packer/start/packer.nvim

chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing libs" | cowsay 
# Libs
sudo pacman -S base-devel autoconf git
cd
cd Downloads
git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si
sudo mv yay-git /opt 
cd

echo "Installing programming languages" | cowsay 
# Programming Languages
sudo pacman -S go gcc nodejs

echo "Installing utils" | cowsay 
# Utils
sudo pacman -S ncdu nginx-mainline docker ufw openvpn htop dmenu i3 fzf 
yay -S obsidian 
yay -S wireguard-arch wireguard-tools

rice() {

    echo "Installing fonts" | cowsay
    cd
    cd Downloads
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip
    unzip JetBrainsMono.zip
    sudo mv JetBrainsMono /usr/share/fonts

    sudo echo FONT=JetBrainsMonoNerdFont-Bold 12 >> /etc/locale.conf
    sudo fc-cache -fv

}


reboot

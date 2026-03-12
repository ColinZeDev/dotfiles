#!/usr/bin/env bash
set -e

clear
echo -e "\033[1m\033[38;5;214m+-----------------------------------------+\033[0m"
echo -e "\033[1m\033[38;5;214m| ####################################### |\033[0m"
echo -e "\033[1m\033[38;5;214m| ##   ColinZeDev's Dotfiles Installer ## |\033[0m"
echo -e "\033[1m\033[38;5;214m| ##               v0.0.1              ## |\033[0m"
echo -e "\033[1m\033[38;5;214m| ####################################### |\033[0m"
echo -e "\033[1m\033[38;5;214m+-----------------------------------------+\033[0m"
echo

sudo pacman -Syu \
    bspwm \
    sxhkd \
    xorg-xinit \
    picom \
    polybar \
    rofi \
    dunst \
    feh \
    kitty \
    thunar \
    tumbler \
    pamixer \
    thunar-archive-plugin \
    yad \
    zsh \
    zoxide \
    bat \
    git \
    xorg-xrandr \
    xdg-desktop-portal-gtk \
    xdg-desktop-portal \
    noto-fonts-emoji

git clone https://aur.archlinux.org/yay.git /tmp/yay
(cd /tmp/yay && makepkg -si)

yay -S \
    visual-studio-code-bin \
    cloudflare-warp-bin \
    i3lock-color

echo
echo -e "\033[38;5;214mSetting up Cloudflare WARP...\033[0m"
warp-cli registration new

read -rp "WARP registered. Connect to VPN now? [y/N] " confirm
if [[ "$confirm" =~ ^[Yy]$ ]]; then
    warp-cli connect
    echo -e "\033[38;5;214mWARP connected.\033[0m"
else
    echo "Skipping WARP connection. You can connect later with: warp-cli connect"
fi

git clone https://github.com/ColinZeDev/dotfiles.git /tmp/colin_dotfiles
cp /tmp/colin_dotfiles/.zshrc ~/.zshrc
cp /tmp/colin_dotfiles/.xinitrc ~/.xinitrc
cp -r /tmp/colin_dotfiles/.config/* ~/.config/

chsh -s /bin/zsh

echo
echo -e "\033[1m\033[38;5;214mDone! Log out and back in to start using bspwm.\033[0m"

#!/usr/bin/env bash
set -e

clear
echo -e "\033[1m\033[38;5;214m+-----------------------------------------+\033[0m"
echo -e "\033[1m\033[38;5;214m| ####################################### |\033[0m"
echo -e "\033[1m\033[38;5;214m| ##   ColinZeDev's Dotfiles Installer ## |\033[0m"
echo -e "\033[1m\033[38;5;214m| ##               v0.0.2              ## |\033[0m"
echo -e "\033[1m\033[38;5;214m| ####################################### |\033[0m"
echo -e "\033[1m\033[38;5;214m+-----------------------------------------+\033[0m"
echo

sudo pacman -Syu \
    bspwm \
    sxhkd \
    xorg-xinit \
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
    xdg-utils \
    noto-fonts-emoji \
    flameshot \
    xclip \
    papirus-icon-theme \
    brightnessctl

git clone https://aur.archlinux.org/yay.git /tmp/yay
(cd /tmp/yay && makepkg -si)

yay -S \
    visual-studio-code-bin \
    i3lock-color \
    papirus-folders \
    picom-ftlabs-git

git clone https://github.com/ColinZeDev/dotfiles.git /tmp/colin_dotfiles
cp /tmp/colin_dotfiles/.zshrc ~/.zshrc
cp /tmp/colin_dotfiles/.xinitrc ~/.xinitrc
cp -r /tmp/colin_dotfiles/.config/* ~/.config/

papirus-folders -C orange --theme Papirus-Dark
mkdir -p ~/.local/share/icons
cat > ~/.local/share/icons/default/index.theme << EOF
[Icon Theme]
Name=Default
Comment=Default icon theme
Inherits=Papirus-Dark
EOF

xdg-mime default thunar.desktop inode/directory

chsh -s /bin/zsh

echo
echo -e "\033[1m\033[38;5;214mDone! Log out and back in to start using bspwm.\033[0m"

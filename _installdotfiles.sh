#!/usr/bin/env bash
set -e

clear
echo -e "\033[1m\033[38;5;214m+-----------------------------------------+\033[0m"
echo -e "\033[1m\033[38;5;214m| ####################################### |\033[0m"
echo -e "\033[1m\033[38;5;214m| ##   ColinZeDev's Dotfiles Installer ## |\033[0m"
echo -e "\033[1m\033[38;5;214m| ##               v0.0.5              ## |\033[0m"
echo -e "\033[1m\033[38;5;214m| ####################################### |\033[0m"
echo -e "\033[1m\033[38;5;214m+-----------------------------------------+\033[0m"
echo

AUR_HELPER=""
if command -v paru &>/dev/null; then
    AUR_HELPER="paru"
elif command -v yay &>/dev/null; then
    AUR_HELPER="yay"
fi

if [[ -z "$AUR_HELPER" ]]; then
    echo -e "\033[38;5;214mNo AUR helper found, installing yay...\033[0m"
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    (cd /tmp/yay && makepkg -si)
    AUR_HELPER="yay"
else
    echo -e "\033[38;5;214mUsing existing AUR helper: $AUR_HELPER\033[0m"
fi

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
    brightnessctl \
    xdotool \
    mpv \
    flatpak

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install io.gitlab.librewolf-community

git clone https://aur.archlinux.org/yay.git /tmp/yay
(cd /tmp/yay && makepkg -si)

$AUR_HELPER -S \
    visual-studio-code-bin \
    i3lock-color \
    papirus-folders \
    picom-ftlabs-git \
    ttf-nerd-fonts-symbols-mono \
    ttf-fira-code

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

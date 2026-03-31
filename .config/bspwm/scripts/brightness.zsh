#!/bin/zsh

case "$1" in
    up)   brightnessctl set "${2:-5}%+" ;;
    down) brightnessctl set "${2:-5}%-" ;;
esac
val=$(brightnessctl -m | cut -d, -f4)
notify-send -t 950 -h string:x-dunst-stack-tag:brightness \
    -h int:value:$(echo "$val" | tr -d '%') "Brightness" "$val"
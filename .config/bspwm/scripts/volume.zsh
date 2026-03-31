#!/bin/zsh

case "$1" in
    up)   pamixer --unmute -i "${2:-5}" ;;
    down) pamixer --unmute -d "${2:-5}" ;;
    mute) pamixer --toggle-mute ;;
    mic)  pamixer --default-source -t ;;
esac

if [[ "$1" == "mute" ]]; then
    msg=$([ "$(pamixer --get-mute)" = "true" ] && echo Muted || echo Unmuted)
    notify-send -t 950 -h string:x-dunst-stack-tag:volume "Volume" "$msg"
elif [[ "$1" == "mic" ]]; then
    msg=$([ "$(pamixer --default-source --get-mute)" = "true" ] && echo Muted || echo Unmuted)
    notify-send -t 950 -h string:x-dunst-stack-tag:micmute "Microphone" "$msg"
else
    notify-send -t 950 -h string:x-dunst-stack-tag:volume -h int:value:$(pamixer --get-volume) "Volume" "$(pamixer --get-volume)%"
fi
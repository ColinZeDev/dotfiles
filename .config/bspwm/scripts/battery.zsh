#!/bin/zsh

PCT=$(cat /sys/class/power_supply/BAT0/capacity)
STATUS=$(cat /sys/class/power_supply/BAT0/status)

EFFECT_LOWBATTERY="$HOME/.config/bspwm/sounds/lowbattery.mp3"
EFFECT_CHARGEOVER20="$HOME/.config/bspwm/sounds/chargerplugin.mp3"
EFFECT_CHARGEUNDER20="$HOME/.config/bspwm/sounds/batterychargeunder20.mp3"

STATE_FILE="/tmp/battery_polybar_state"

PREV_STATUS=""
PREV_PCT=0
if [[ -f "$STATE_FILE" ]]; then
    PREV_STATUS=$(awk '{print $1}' "$STATE_FILE")
    PREV_PCT=$(awk '{print $2}' "$STATE_FILE")
fi

play_sound() {
    mpv --no-terminal --volume=70 "$1" &>/dev/null &
}

if [[ "$STATUS" == "Charging" && "$PREV_STATUS" != "Charging" ]]; then
    if (( PCT < 20 )); then
        play_sound "$EFFECT_CHARGEUNDER20"
    else
        play_sound "$EFFECT_CHARGEOVER20"
    fi
fi

if [[ "$STATUS" != "Charging" ]] && (( PCT < 20 )) && (( PREV_PCT >= 10 )); then
    play_sound "$EFFECT_LOWBATTERY"
fi

if [[ "$STATUS" != "Charging" ]] && (( PCT < 20 )) && (( PREV_PCT >= 30 )); then
    notify-send -u critical -i battery-low "Low Battery" "${PCT}% remaining — plug in soon"
fi

echo "$STATUS $PCT" > "$STATE_FILE"

if   (( PCT == 100 ));  then ICON="󱟢"
elif (( PCT >= 90 ));   then ICON="󰂂"
elif (( PCT >= 80 ));   then ICON="󰂁"
elif (( PCT >= 70 ));   then ICON="󰂀"
elif (( PCT >= 60 ));   then ICON="󰁿"
elif (( PCT >= 50 ));   then ICON="󰁾"
elif (( PCT >= 40 ));   then ICON="󰁽"
elif (( PCT >= 30 ));   then ICON="󰁼"
elif (( PCT >= 20 ));   then ICON="󰁻"
elif (( PCT >= 10 ));   then ICON="󰂃"
else                         ICON="󰂑"
fi

if   (( PCT == 100 )); then COLOR="#a6e3a1"
elif (( PCT >= 90 ));  then COLOR="#b8e08a"
elif (( PCT >= 80 ));  then COLOR="#cadd72"
elif (( PCT >= 70 ));  then COLOR="#dcd95b"
elif (( PCT >= 60 ));  then COLOR="#eed643"
elif (( PCT >= 50 ));  then COLOR="#f9c832"
elif (( PCT >= 40 ));  then COLOR="#f9a832"  
elif (( PCT >= 30 ));  then COLOR="#f98832"
elif (( PCT >= 20 ));  then COLOR="#f96832"
elif (( PCT >= 10 ));  then COLOR="#f94832"
else                        COLOR="#ff3300"
fi

if [[ "$STATUS" == "Charging" ]]; then
    echo "%{F#a6e3a1}󰂄 ${PCT}%%{F-}"
elif [[ "$STATUS" == "Full" ]]; then
    echo "%{F#a6e3a1}󰁹 full%{F-}"
else
    echo "%{F${COLOR}}${ICON} ${PCT}%%{F-}"
fi

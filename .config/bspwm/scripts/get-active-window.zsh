#!/bin/zsh

ACTIVEWINDOW="$(xprop -id $(xdotool getactivewindow 2>/dev/null) WM_CLASS 2>/dev/null | awk -F'"' '{print $4}')"
FALLBACK="BSPWM Desktop"

echo "${ACTIVEWINDOW:-$FALLBACK}"
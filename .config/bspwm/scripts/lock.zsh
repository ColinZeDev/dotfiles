#!/bin/zsh

i3lock \
    --nofork \
    --clock \
    --indicator \
    --inside-color=1a1a1aff \
    --ring-color=ff6600ff \
    --ringver-color=ff8800ff \
    --ringwrong-color=ff3300ff \
    --line-color=ff8800ff \
    --keyhl-color=ffffffff \
    --bshl-color=ff3300ff \
    --separator-color=00000000 \
    --insidever-color=1a1a1aff \
    --insidewrong-color=1a1a1aff \
    --verif-color=ff8800ff \
    --wrong-color=ff3300ff \
    --time-color=ff8800ff \
    --date-color=ff6600ff \
    --layout-color=555555ff \
    --time-str="%H:%M" \
    --date-str="%a %d %b" \
    --verif-text="verifying..." \
    --wrong-text="nope." \
    --noinput-text="" \
    --radius=120 \
    --ring-width=8 \
    --blur 6.5
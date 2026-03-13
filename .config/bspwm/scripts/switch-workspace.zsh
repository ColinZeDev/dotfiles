#!/bin/zsh

if [[ "$1" == "prev" || "$1" == "next" ]]; then
    bspc desktop -f "$1".local
elif [[ "$1" =~ ^[0-9]+$ ]]; then
    bspc desktop -f "^$1"
fi
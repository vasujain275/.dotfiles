#!/usr/bin/env zsh

waybar &

wl-paste --type text --watch cliphist store &  # clipboard store text data
wl-paste --type image --watch cliphist store & # clipboard store image data

dunst &


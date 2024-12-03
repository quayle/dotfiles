#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

configs=("alacritty" "foot" "i3" "i3status" "nvim" "rofi" "sway" "swayidle" "swaylock" "waybar" "wlogout" "wob" "wofi")

for config in ${configs[@]}; do
    if test -L "$HOME/.config/$config"; then
        echo "Not linking '$config' as link already exists";
    elif test -d "$HOME/.config/$config"; then
        echo "Not linking '$config' as directory already exists";
    else 
        ln -s "$SCRIPT_DIR/.config/$config" "$HOME/.config/$config";
    fi;
done

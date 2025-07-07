#!/usr/bin/env bash

DOTDIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

configs=("alacritty" "fontconfig" "foot" "i3" "i3status" "i3blocks" "nvim" "rofi" "sway" "swayidle" "swaylock" "waybar" "wlogout" "wob" "wofi")

for config in ${configs[@]}; do
    if test -L "$HOME/.config/$config"; then
        echo "[-] Not linking '$config' as link already exists";
    elif test -d "$HOME/.config/$config"; then
        echo "[-] Not linking '$config' as directory already exists";
    else 
        ln -s "$DOTDIR/.config/$config" "$HOME/.config/$config";
        echo "[+] Linking '.config/$config'";
    fi;
done

# $XDG_DATA_HOME == ~/.local/share
locals=("fonts" "konsole")
for share in ${locals[@]}; do
    if test -L "$HOME/.local/share/$share"; then
        echo "[-] Not linking '$share' as link already exists";
    elif test -d "$HOME/.local/share/$share"; then
        echo "[-] Not linking '$share' as directory already exists";
    else
        ln -s "$DOTDIR/.local/share/$share" "$HOME/.local/share/$share";
        echo "[+] Linking '$share";
    fi;
done

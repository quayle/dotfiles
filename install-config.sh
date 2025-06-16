#!/usr/bin/env bash

DOTDIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

configs=("alacritty" "foot" "i3" "i3status" "i3blocks" "nvim" "rofi" "sway" "swayidle" "swaylock" "waybar" "wlogout" "wob" "wofi")

for config in ${configs[@]}; do
    if test -L "$HOME/.config/$config"; then
        echo "Not linking '$config' as link already exists";
    elif test -d "$HOME/.config/$config"; then
        echo "Not linking '$config' as directory already exists";
    else 
        ln -s "$DOTDIR/.config/$config" "$HOME/.config/$config";
    fi;
done

# sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/nvim 1 && \
# sudo update-alternatives --set editor /usr/local/bin/nvim
#

share="fonts"
if test -L "$HOME/.local/share/$share"; then
    echo "Not linking '$share' as link already exists";
elif test -d "$HOME/.local/share/$share"; then
    echo "Not linking '$share' as directory already exists";
else
    ln -s "$DOTDIR/.local/share/$share" "$HOME/.local/share/$share";
fi;

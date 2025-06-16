#!/usr/bin/env bash

DOTDIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

IOSEVKA_VER=33.2.5
IOSEVKA_URL="https://github.com/be5invis/Iosevka/releases/download/v$IOSEVKA_VER/SuperTTC-Iosevka-$IOSEVKA_VER.zip"

if ! test -d "$DOTDIR/.local/share/fonts/iosevka"; then
    wget "$IOSEVKA_URL" -O "/tmp/IosevkaTerm-$IOSEVKA_VER.zip"
    if test -e "/tmp/IosevkaTerm-$IOSEVKA_VER.zip"; then
        unzip -o "/tmp/IosevkaTerm-$IOSEVKA_VER.zip" -d "$DOTDIR/.local/share/fonts/iosevka"
        # .local/share/fonts/Iosevka.ttc
        rm "/tmp/IosevkaTerm-$IOSEVKA_VER.zip"
    fi
fi

HACK_VER=3.003
HACK_URL="https://github.com/source-foundry/Hack/releases/download/v$HACK_VER/Hack-v$HACK_VER-ttf.zip"

if ! test -d "$DOTDIR/.local/share/fonts/hack"; then
    wget "$HACK_URL" -O "/tmp/Hack-$HACK_VER.zip"
    if test -e "/tmp/Hack-$HACK_VER.zip"; then
        unzip -o "/tmp/Hack-$HACK_VER.zip" -d "$DOTDIR/.local/share/fonts/hack"
        mv $DOTDIR/.local/share/fonts/hack/ttf/*.ttf "$DOTDIR/.local/share/fonts/hack/"
        rm -r "$DOTDIR/.local/share/fonts/hack/ttf"
        rm "/tmp/Hack-$HACK_VER.zip"
    fi
fi

fc-cache -f -v

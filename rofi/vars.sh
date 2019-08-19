#!/bin/bash
FOREGROUND="#D0D0D0"
# FOREGROUND=$(xrdb -query | grep 'color6:'| awk 'NR==1{print $NF}')
ROFI_OPTIONS=(-theme $HOME/.config/rofi/rofi_full -font "Roboto 16" -m 0 -fullscreen 0 -theme-str "*{accent: $FOREGROUND;}")
# ROFI_OPTIONS=(-theme $HOME/.config/rofi/rofi_full -m 0 -theme-str "*{accent: ${FOREGROUND:-#000000};}")

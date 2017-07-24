#!/bin/sh

ratmenu -fg "#cccccc" -bg "#000000" -align left -style dreary -font "-*-terminus-*-*-*-*-12-*-*-*-*-*-*-*" \
"dmenu" "dmenu_run" \
"FireFox" "firefox" \
"Sublime Text" "subl" \
"WICD" "urxvtc -e wicd-curses" \
"htop" "urxvtc -e htop" \
"rtorrent" "urxvtc -e rtorrent" \
"MC" "urxvtc -e mc" \
"AlsaMixer" "urxvtc -e alsamixer" \
"MOCP" "urxvtc -e mocp -T trans" \

#!/bin/sh
source /home/bee/.config/dzenScripts/vars.sh

GAP=$(bspc config -d focused window_gap)
TIL=$(bspc wm -g | awk -F ":" '{print $12}')
# LM = monocle
# LT = tile

# STR=''

if [ $GAP = 0 ]; then
  STR="full"
else
  STR="gap"
fi

if [ $TIL = 'LM' ]; then
  STR="${STR}_mon"
else
  STR="${STR}_tile"
fi


echo "^bg($BGL)^fg(#606060)^pa(207;3)^i($PAT/icons/$STR.xbm)";

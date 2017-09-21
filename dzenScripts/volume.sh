#!/bin/sh
source /home/bee/.config/dzenScripts/vars.sh

isMute=`amixer get Master | grep "Front Left:" | awk '{print $6}'`
if [ $isMute == "[on]" ]; then
    vol=`amixer get Master | grep "Front Left:" | awk '{print $5}' | tr -d '[]'`
    if [ $vol == "0%" ]; then
        echo -en "^fg(#303030)"
    else
        echo -en "^fg($IFG)"
    fi
else
    echo -en "^fg(#303030)"
fi

echo -en "^i("$PAT"/icons/spkr_01.xbm)^p(5;-1)"
eval echo $vol $GDBAR

#!/bin/sh
source ../vars.sh

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

res=$( eval echo $vol $GDBAR -h '14' );

echo -en "^ca(4, amixer sset Master 10%+ )^ca(5, amixer sset Master 10%- )"
echo -en "^bg(#404040)^ca(1, amixer sset Master 10%- )^i(../icons/minus.xbm)^ca()^p(10;3)^bg(#303030)"
echo -en $res
echo "^p(10;-3)^bg(#404040)^ca(1, amixer sset Master 10%+ )^fg($IFG)^i(../icons/plus.xbm)^ca()"

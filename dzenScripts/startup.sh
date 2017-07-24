#!/bin/sh

source /home/bee/.config/dzenScripts/vars.sh

killall dzen2

sh $PAT/progress_bar.sh | dzen2 -x '220' -w '1128' -h '2' -ta 'l' -bg $BGL -y '0' -title-name 'progress_bar' -e 'onstart=lower' &
sleep 1 && sh $PAT/ewmhPanelLeft.sh | dzen2 -x '0' -y '0' -h '20' -w '1348' -ta l -title-name 'panel_left' -fn 'xos4 Terminus:pixelsize=12' -bg $BGL -e 'onstart=lower' &
sh ~/.config/dzenScripts/ewmhPanelRight.sh | dzen2 -x '1348' -y '0' -h '20' -w '572' -ta l -fn 'xos4 Terminus:pixelsize=12' -bg $BGL -e 'onstart=lower' &

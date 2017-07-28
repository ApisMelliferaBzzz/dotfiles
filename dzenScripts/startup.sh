#!/bin/sh

source /home/bee/.config/dzenScripts/vars.sh

killall dzen2

sh $PAT/progress_bar.sh | dzen2 -x '220' -w '1125' -h '2' -ta 'l' -bg $BGL -y '0' -title-name 'progress_bar' -e 'onstart=lower' &
#sleep is needed for progress_bar to be above main panel and at the same time beneath normal windows
sleep 1 && sh $PAT/ewmhPanelLeft.sh | dzen2 -x '0' -y '0' -h '20' -w '1348' -ta l -title-name 'panel_left' -fn 'xos4 Terminus:pixelsize=12' -bg $BGL -e 'onstart=lower' &
sh ~/.config/dzenScripts/ewmhPanelRight.sh | dzen2 -x '1345' -y '0' -h '20' -w '575' -ta l -bg $BGD -fn 'xos4 Terminus:pixelsize=12' -e 'onstart=lower' &

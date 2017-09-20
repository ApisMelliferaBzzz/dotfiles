#!/bin/sh

source /home/bee/.config/dzenScripts/vars.sh

killall dzen2

sh ~/.dotfiles/dzenScripts/ewmhPanelLeftTop.sh | dzen2 -x '0' -w '1345' -h '2' -ta 'l' -bg $BGL -y '0' -title-name 'progress_bar' -e 'onstart=lower' &
#sleep is needed for progress_bar to be above main panel and at the same time beneath maximized windows
sleep 1 && sh ~/.dotfiles/dzenScripts/ewmhPanelLeftBottom.sh | dzen2 -x '0' -y '2' -h '18' -w '1345' -ta l -title-name 'panel_left' -fn 'xos4 Terminus:pixelsize=12' -bg $BGL -e 'onstart=lower' &
sh ~/.config/dzenScripts/ewmhPanelRight.sh | dzen2 -x '1345' -y '0' -h '20' -w '575' -ta l -bg $BGD -fn 'xos4 Terminus:pixelsize=12' -e 'onstart=lower' &
#sleep 1 && sh $PAT/ewmhPanelUni.sh | dzen2 -x '0' -y '0' -h '20' -ta l -title-name 'panel_left' -fn 'xos4 Terminus:pixelsize=12' -bg $BGL -e 'onstart=lower' -dock

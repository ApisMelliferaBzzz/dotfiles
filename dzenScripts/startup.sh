#!/bin/sh

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd $parent_path
source ./vars.sh

killall dzen2

sh ./ewmhPanelLeftTop.sh | dzen2 -x '0' -w '1345' -h '2' -ta 'l' -bg $BGL -y '0' -title-name 'progress_bar' -e 'onstart=lower' &
sh ./ewmhPanelLeftBottom.sh | dzen2 -x '0' -y '2' -h '18' -w '1345' -ta l -title-name 'panel_left' -fn 'xos4 Terminus:pixelsize=12' -bg $BGL -e 'onstart=lower' &
sh ./ewmhPanelRight.sh | dzen2 -x '1345' -y '0' -h '20' -w '575' -ta l -bg $BGD -fn 'xos4 Terminus:pixelsize=12' -e 'onstart=lower' &

MONITORS=$(xrandr -q | grep -c ' connected');
if [[ $MONITORS -eq 2 ]];
then
	sh ./ewmhPanelLeftTop.sh | dzen2 -x '1920' -w '1345' -h '2' -ta 'l' -bg $BGL -y '0' -title-name 'progress_bar' -e 'onstart=lower' &
	sh ./ewmhPanelLeftBottom.sh | dzen2 -x '1920' -y '2' -h '18' -w '1345' -ta l -title-name 'panel_left' -fn 'xos4 Terminus:pixelsize=12' -bg $BGL -e 'onstart=lower' &
	sh ./ewmhPanelRight.sh | dzen2 -x '3265' -y '0' -h '20' -w '575' -ta l -bg $BGD -fn 'xos4 Terminus:pixelsize=12' -e 'onstart=lower' &
fi


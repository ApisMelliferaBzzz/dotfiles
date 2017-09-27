#!/bin/sh
#sh .config/dzenScripts/ewmhPanel.sh | dzen2 -x 0 -y 0 -h 21 -w 1920 -ta l -fn 'Terminus:pixelsize=12' -bg '#333'
source /home/bee/.config/dzenScripts/vars.sh
get_vol() {
	./volume_popup_handler.sh
}
while true; do
	echo "^fg($FG)^bg($BGL)$(get_vol)"
	sleep 1
	# wait;
done
#sh ./volume_popup_launcher.sh | dzen2 -x '1500px' -y '20px' -w '170px' -h '20px' -bg '#303030'

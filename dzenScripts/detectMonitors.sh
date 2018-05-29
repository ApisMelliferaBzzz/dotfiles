MONITORS=$(xrandr -q | grep -c ' connected');

if [[ $MONITORS -eq 1 ]]; then
	xrandr --output LVDS-1 --mode 1920x1080 --pos 0x0 --rotate normal &
	bspc monitor -d 1 2 3 4 5 6 7 8 9 10
	bspc rule -a Firefox desktop=^2
	bspc rule -a Chromium desktop=^2
fi

if [[ $MONITORS -eq 2 ]]; then
	xrandr --output HDMI-1 --mode 1920x1080 --pos 0x0 --rotate normal --output LVDS-1 --mode 1920x1080 --pos 1920x0 --rotate normal &
	bspc monitor HDMI-1 -d 6 7 8 9 10
	bspc monitor LVDS-1 -d 1 2 3 4 5
	bspc rule -a Firefox desktop=^6
	bspc rule -a Chromium desktop=^6
fi

feh --bg-tile ~/Media_storage/images/forest-fog-b\&w.jpg &
sh ~/.config/dzenScripts/startup.sh

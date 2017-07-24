GAP=$(bspc config -d focused window_gap)

if [ $GAP -eq 50 ]; then
	bspc config -d focused window_gap 0
	bspc desktop -l next
elif [ $GAP -eq 0 ]; then
	bspc config -d focused window_gap 50
	bspc desktop -l next
fi

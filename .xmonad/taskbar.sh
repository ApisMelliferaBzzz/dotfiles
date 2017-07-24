FG="#808080"
BG="#303030"
(echo "Task List"; wmctrl -l) | \
    dzen2 \
        -m -p -l 15 -x 0 -y 1080 -w 1920 -fg $FG -bg $BG -e \
'button1=menuprint;button3=exit;entertitle=uncollapse;leaveslave=collapse' | \
    awk '{system("wmctrl -s " $2)}'
#bin/bash
#awk '{print} END{print NR}'
STST=$(wmctrl -l | awk 'END{print NR}')
# ST=$(wc "$STST")
echo $STST
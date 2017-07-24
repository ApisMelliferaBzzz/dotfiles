#!/bin/sh
LIST=$(ps axo args,pmem --sort -pmem | head -n 6)

for (( i = 2; i <= 6; i++ )); do
	NAME=$(ps axo args,pmem --sort -pmem | head -n 6 | awk '{if (NR=='$i') {print $1}}')
	PERC=$(ps axo args,pmem --sort -pmem | head -n 6 | awk '{if (NR=='$i') {print $NF}}')
	echo $NAME $PERC "^ca(1, killall $NAME) X ^ca()"
done
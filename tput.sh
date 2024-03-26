#!/bin/bash

clear
verticaloffset=1
for i in {1..10}; do
	if [ $i -le 5 ]; then
		tput cup $i $i;
	else
		if [ $i -eq 6 ]; then

		tput cup $(expr $i - $verticaloffset) $i
		verticaloffset=$(($verticaloffset + 2))
	fi
	echo -n blop;
	sleep .2;
done
tput cup 10

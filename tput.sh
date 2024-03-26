#!/bin/bash

clear
verticaloffset=1
for i in {1..10}; do
	if [ $i -le 5 ]; then
		tput cup $i $i;
	else
		tput cup $(($i - $verticaloffset)) $(($i + 3))
		verticaloffset=$(($verticaloffset + 2))
	fi
	echo -n blop;
	sleep .2;
done
tput cup $(tput lines)
echo -n blop
sleep .2
tput cup $(tput lines) $(($(tput cols) - 4))
echo -n blop
sleep .2
tput cup 0 $(($(tput cols) - 4))
echo -n blop
sleep .2
tput cup $(($(tput lines) / 2)) $((($(tput cols) / 2) - 2))
echo -n blop
sleep .2
tput cup 6

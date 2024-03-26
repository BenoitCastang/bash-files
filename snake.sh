#!/bin/bash

clear
windowlines=$(tput lines)
windowcols=$(tput cols)
snakeyposition=$(expr $windowlines / 2)
snakexposition=$(expr $windowcols / 2)
foodyposition=10
foodxposition=10
snakesize=1
tput civis
tput cup $snakeyposition $snakexposition
echo "*"
while [ true ]; do
	clear
	tput cup $foodxposition $foodyposition
	echo -n "*"
	tput cup $snakeyposition $snakexposition
	for i in $(seq 1 $snakesize); do
		echo -n "*"
	done
	read -n 1 -s key
	if [[ $key == "j" || $key == "s" ]]; then
		snakeyposition=$(expr $snakeyposition + 1)
	elif [[ $key == "k" || $key == "w" ]]; then
		snakeyposition=$(expr $snakeyposition - 1)
	elif [[ $key == "h" || $key == "a" ]]; then
		snakexposition=$(expr $snakexposition - 3)
	elif [[ $key == "l" || $key == "d" ]]; then
		snakexposition=$(expr $snakexposition + 3)
	elif [ $key == "q" ]; then
		tput cnorm
		clear
		exit
	fi
	if [[ $foodyposition -eq $snakeyposition && $foodxposition -eq $snakexposition ]]; then
		snakesize=$(expr $snakesize + 1)
		foodyposition=$((RANDOM % ($windowlines + 1 - 1) + 1))
		foodxposition=$((RANDOM % ($windowcols + 1 - 1) + 1))
	fi	
done

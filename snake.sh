#!/bin/bash

windowlines=$(tput lines)
windowcols=$(tput cols)
snakeyposition=$(expr $windowlines / 2)
snakexposition=$(expr $windowcols / 2)
foodyposition=$((RANDOM % ($windowlines + 1 - 1) + 1))
foodxposition=$((RANDOM % ($windowcols + 1 - 1) + 1))
snakesize=1
tput civis
while [ true ]; do
	clear
	echo "snake x = $snakexposition"
	echo "snake y = $snakeyposition"
	echo "food x = $foodxposition"
	echo "food y = $foodyposition"
	echo "snake size = $snakesize"
	tput cup $foodxposition $foodyposition
	echo -en "\e[47m  \e[0m"
	tput cup $snakeyposition $snakexposition
	# for i in $(seq 1 $snakesize); do
	# 	echo -en "\e[47m  \e[0m"
	# done
	if [ $snakesize -eq 1 ]; then
		echo -en "\e[47m  \e[0m"
	fi
	if [ $snakesize -eq 2 ]; then
		echo -en "\e[47m    \e[0m"
	fi
	if [ $snakesize -eq 3 ]; then
		echo -en "\e[47m      \e[0m"
	fi
	read -n 1 -s key
	if [[ $key == "j" || $key == "s" ]]; then
		snakeyposition=$(expr $snakeyposition + 1)
	elif [[ $key == "k" || $key == "w" ]]; then
		snakeyposition=$(expr $snakeyposition - 1)
	elif [[ $key == "h" || $key == "a" ]]; then
		snakexposition=$(expr $snakexposition - 2)
	elif [[ $key == "l" || $key == "d" ]]; then
		snakexposition=$(expr $snakexposition + 2)
	elif [ $key == "q" ]; then
		tput cnorm
		clear
		exit
	fi
	if [[ $foodyposition -eq $snakeyposition && $foodxposition -eq $snakexposition ]]; then
		snakesize=$(expr $snakesize + 1)
		foodyposition=$((RANDOM % $windowlines + 1))
		foodxposition=$((RANDOM % $windowcols + 1))
	fi	
done

#!/bin/bash

draw() {
	tput cup $1 $2
	echo -en 
}
windowlines=$(tput lines)
windowcols=$(tput cols)
snakexposition=$(expr $windowcols / 2)
snakeyposition=$(expr $windowlines / 2)
foodxposition=$((RANDOM % ($windowcols/2 + 1) * 2))
foodyposition=$((RANDOM % $windowlines + 1))
snakesize=0
snakedrawing="  "
tput civis
while [ true ]; do
	clear
	echo "window y = $windowlines"
	echo "window x = $windowcols"
	echo "snake x = $snakexposition"
	echo "snake y = $snakeyposition"
	echo "food x = $foodxposition"
	echo "food y = $foodyposition"
	echo "snake size = $snakesize"
	tput cup $foodyposition $foodxposition
	echo -en "\e[47m  \e[0m"
	tput cup $snakeyposition $snakexposition
	echo -en "\e[41m  \e[0m"
	echo -en "\e[47m"
	for i in $(seq 1 $snakesize); do
		echo -en "$snakedrawing"
	done
	echo -en "\e[0m"
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
		foodxposition=$((RANDOM % ($windowcols/2 + 1) * 2))
		foodyposition=$((RANDOM % $windowlines + 1))
	fi	
done

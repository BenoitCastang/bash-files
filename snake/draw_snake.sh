#!/bin/bash

draw_snake() {
	tput cup $snakeyposition $snakexposition
	echo -en "\e[41m  \e[0m"
	echo -en "\e[47m"
	for i in $(seq 1 $snakesize); do
		echo -en "$snakedrawing"
	done
	echo -en "\e[0m"
}

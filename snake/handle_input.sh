#!/bin/bash

handle_input() {
	read -n 1 -s key
	if [[ $key == "j" || $key == "s" ]]; then
		snakeyposition=$(expr $snakeyposition + 1)
		snakeorientation="down"
	elif [[ $key == "k" || $key == "w" ]]; then
		snakeyposition=$(expr $snakeyposition - 1)
		snakeorientation="up"
	elif [[ $key == "h" || $key == "a" ]]; then
		snakexposition=$(expr $snakexposition - 2)
		snakeorientation="left"
	elif [[ $key == "l" || $key == "d" ]]; then
		snakexposition=$(expr $snakexposition + 2)
		snakeorientation="right"
	elif [[ $key == "l" || $key == "d" ]]; then
	elif [ $key == "q" ]; then
		tput cnorm # restore cursor to its normal state
		clear
		exit
	fi
}

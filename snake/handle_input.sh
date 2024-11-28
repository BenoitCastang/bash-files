#!/bin/bash

exit_snake() {
	tput cnorm
	clear
	exit
}

handle_input() {
	read -n 1 -s key
	if [[ "$key" == "j" || "$key" == "s" ]]; then
		(( snakeyposition++ ))
		snakeorientation="down"
	elif [[ "$key" == "k" || "$key" == "w" ]]; then
		(( snakeyposition-- ))
		snakeorientation="up"
	elif [[ "$key" == "h" || "$key" == "a" ]]; then
		(( snakexposition -= 2 ))
		snakeorientation="left"
	elif [[ "$key" == "l" || "$key" == "d" ]]; then
		(( snakexposition += 2 ))
		snakeorientation="right"
	elif [ "$key" == "q" ]; then
		exit_snake
	fi
}

trap "exit_snake" SIGINT

#!/bin/bash

make_even() {
	arg="$1"
	if (( arg % 2 != 0 )); then
		echo $(( arg - 1 ))
	else
		echo $arg
	fi
}

set_initial_variables() {
	windowlines=$(tput lines)
	windowcols=$(make_even $(tput cols))
	snakexposition=$((windowcols / 2))
	snakeyposition=$((windowlines / 2))
	foodxposition=$((RANDOM % ($windowcols/2 + 1) * 2))
	foodyposition=$((RANDOM % $windowlines + 1))
	snakesize=0
	snakeorientation=''
	snakedrawing="  "
}

## make the snake turn its body
## make the snake go forward by itself
## handle screen borders

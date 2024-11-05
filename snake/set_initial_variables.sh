#!/bin/bash

set_initial_variables() {
	windowlines=$(tput lines)
	windowcols=$(tput cols)
	snakexposition=$((windowcols / 2 - 1))
	snakeyposition=$((windowlines / 2))
	foodxposition=$((RANDOM % ($windowcols/2 + 1) * 2))
	foodyposition=$((RANDOM % $windowlines + 1))
	snakesize=0
	snakeorientation=''
	snakedrawing="  "
}


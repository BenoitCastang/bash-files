#!/bin/bash

handle_collisions() {
	if [[ $foodyposition -eq $snakeyposition && $foodxposition -eq $snakexposition ]]; then
		snakesize=$(expr $snakesize + 1)
		foodxposition=$((RANDOM % ($windowcols/2 + 1) * 2))
		foodyposition=$((RANDOM % $windowlines + 1))
	fi	
}

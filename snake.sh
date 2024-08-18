#!/bin/bash

# source files in snake directory
for script in $(dirname $(echo "$0"))/snake/*.sh; do
	source $script
done

set_initial_variables
tput civis # make cursor invisible

while [ true ]; do
	clear
	draw_interface
	draw_food
	draw_snake
	handle_input
	handle_collisions
done

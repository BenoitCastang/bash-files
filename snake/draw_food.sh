#!/bin/bash

draw_food() {
	tput cup $foodyposition $foodxposition
	echo -en "\e[47m  \e[0m"
}

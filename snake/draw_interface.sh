#!/bin/bash

# print coordinates - green if they match
draw_interface() {
	echo "window x = $windowcols"
	echo -e "window y = $windowlines\n"

  if [[ $snakexposition -eq $foodxposition ]]; then
		echo -e "\e[42msnake x = $snakexposition"
		echo -e "food x = $foodxposition\e[0m\n"
	else
		echo "snake x = $snakexposition"
		echo -e "food x = $foodxposition\n"
	fi
  if [[ $snakeyposition -eq $foodyposition ]]; then
		echo -e "\e[42msnake y = $snakeyposition"
		echo -e "food y = $foodyposition\e[0m\n"
	else
		echo "snake y = $snakeyposition"
		echo -e "food y = $foodyposition\n"
	fi
	echo "snake size = $snakesize"
	echo "snake orientation = $snakeorientation"
}

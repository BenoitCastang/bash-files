#!/bin/bash

# Default table for loops to search in is working directory files
for i in *.*; do # for all file that has a extension
	if [ $# -eq 0 ]; then
		mv $i $(echo $i | cut -d. -f1) # if no argument, remove extension of all files
	elif [ $# -eq 1 ]; then
		mv $i $(echo $i | cut -d. -f1).$1 # if one argument, replace the extension
	else
		echo "usage: command <extension_to_set>"
		exit 1
	fi
done
exit 0
# manage files containing another dot than the extension part
# manage adding extension
# mv $i $i.$1

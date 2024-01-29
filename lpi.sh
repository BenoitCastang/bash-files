#!/bin/bash

script_name=$(echo $0 | rev | cut -d '/' -f 1 | rev)
args_number=$#
positionnal_argument=1

if [ $args_number -eq 0 ]; then
	echo "$script_name has no argument"
	exit 1
elif [ $args_number -eq 1 ]; then 
	echo "$script_name has 1 argument: $1"
	exit 0
else
	echo "$script_name has $args_number arguments:"
	for argument in $@; do
		echo "argument $positionnal_argument is $argument"
		((positionnal_argument++))
	done
	exit 0
fi

#!/bin/bash

for arg in $@; do # chech every argument
	echo $arg | grep "^[0-9]*$" > /dev/null # check if argument is a number, discard display
	if [ $? -eq 0 ] && [ $arg -gt 10 ]; then # it is a number
		echo $arg
	fi
done

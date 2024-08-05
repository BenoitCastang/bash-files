#!/bin/bash

name=$1

echo $name | grep "^[a-zA-Z]*$" > /dev/null ## search in the name a letter that must be at the beginning and dump output
if [ $? -eq 0 ]; then ## if exit status of grep is 0, meaning if grep worked
	echo The name is okay
else
	echo The name is not okay
fi

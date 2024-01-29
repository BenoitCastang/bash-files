#!/bin/bash

name=$1

echo $name | grep "^[a-zA-Z]*$" > /dev/null
if [ $? -eq 0 ]; then
	echo The name is okay
else
	echo The name is not okay
fi

#!/bin/bash

while [[ -n $@ ]]; do # While the arguments list is not empty
	echo $@
	shift
done

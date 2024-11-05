#!/bin/bash

usage() {
	echo "Usage: ficinfo.sh <file>"
	echo 
	echo "Test if file exists, if it's a command or a file or a directory."
	exit 2
}
if [[ $# < 1 ]]; then
	usage
fi

tested_files=$@

for tested_file in $tested_files; do
	if [[ -f $tested_file ]]; then
		echo -n "$tested_file is a regular file and "
	elif [[ -d $tested_file ]]; then
		echo -n "$tested_file is a directory and "
	elif [[ -e $tested_file ]]; then
		echo -n "$tested_file is neither a regular file or a directory and "
	elif which $tested_file > /dev/null 2>&1; then
		echo "$tested_file is a command."
		continue
	else
		echo "$tested_file does not exist."
		continue
	fi
	if [[ -x $tested_file ]]; then
		echo -n "is executable and "
	else
		echo -n "is not executable and "
	fi
	if [[ -w $tested_file ]]; then
		echo "is writable."
	else
		echo "is not writable."
	fi
done

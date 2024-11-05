#!/bin/bash

script_name=$(basename $(echo $0))

usage() {
	echo -e "$script_name returns sum and average for provided numbers.\n"
	echo Usage: $script_name 
	echo "Usage: $script_name <file>"
	echo Usage: $script_name number ...
	echo "Usage: $script_name < <file>"
	echo
	echo "File must be numbers separated by new line."
	exit 2
}

is_number() {
	arg=$1
	if [[ ! $arg =~ ^[0-9]*$ ]]; then
		echo -e "$arg is not a number.\n"
		usage
	fi
}

sum=0
num_count=0
args=$@

# no argument provided
if [[ $# < 1 ]]; then
	echo "Enter numbers:"
fi

# arguments provided
if [[ $# > 0 ]]; then
	for arg in $args; do
		if [[ -f $arg ]]; then # file argument
			while read arg; do
				if is_number $arg; then
					((sum += arg))
					((num_count++))
				fi
			done < $arg
		elif is_number $arg; then # number argument
			((sum += arg))
			((num_count++))
		fi
	done
else # no argument provided
	while read arg; do
		if is_number $arg; then
			((sum += arg))
			((num_count++))
		fi
	done
fi

echo Total: $sum
echo "Average: $((sum / num_count))"

exit 0

## handle decimal values, negative values

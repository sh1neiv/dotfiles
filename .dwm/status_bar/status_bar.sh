#!/bin/bash
path_script=$(dirname "$0")

declare -a modules
modules=(
	volume
	batstate
	date_time
)

declare -A modules_short
modules_short=(
	["volume"]="VOL"
	["batstate"]="BAT"
)

while [ 1 ]; do
	output_string=" "
	for pos in ${modules[@]}; do
		module_path="${path_script}/sbar_modules/${pos}"
		if [[ -v "modules_short[$pos]" ]]; then
			output_string+="${modules_short[$pos]}: "
		fi
		output_string+="$($module_path) | "
	done
	xsetroot -name "${output_string%???}"
	sleep .5
done

#!/bin/bash

lines=("")
line=0
position=0
while true; do
	read -s -r -N1 char
	if [ "$char" = $'\x7f' ] || [ "$char" = $'\x08' ]; then
		if [ $position -ne 0 ]; then
			second_part="${lines[line]:position}"
			position=`expr $position - 1`
			first_part="${lines[line]:0:position}"
			lines[line]=$first_part$second_part
			echo -n $'\r'
			tput el
			echo -n "${lines[line]}"
		elif [ $line -ne 0 ]; then
			# echo a
			prev=`expr $line - 1`
			# echo b
			lines[prev]="${lines[prev]}""${lines[line]}"
			# echo c
			unset 'lines[line]'
			# echo d
			line=`expr $line - 1`
			position="${#lines[prev]}"
			# echo f
			for (( i=`expr $line + 1`; i<"${#lines[@]}"; i++ )); do 
				echo -n $'\r'
				tput el
				echo -n "${lines[i]}"
                                echo
			done
			tput cuu `expr "${#lines[@]}" - $line`
		fi
	elif [ "$char" = $'\n' ]; then
		
		# Split 
		first_part="${lines[line]:0:position}"
		second_part="${lines[line]:position}"
		lines[line]=$first_part
		
		# Move 
		line=`expr $line + 1`
		position=0
		
		lines=("${lines[@]:0:line}" $second_part "${lines[@]:line}")
		for (( i=`expr $line - 1`; i<"${#lines[@]}"; i++ )); do
                        echo -n $'\r'
			tput el 
                        echo "${lines[i]}"
                done
		moveup=`expr "${#lines[@]}" - $line`
		if [ $moveup -gt 0 ]; then
			tput cuu $moveup
		fi
	else
		first_part="${lines[line]:0:position}"
		second_part="${lines[line]:position}"
                position=`expr $position + 1`
                lines[line]=$first_part$char$second_part
                tput el
                echo -n $'\r'
                echo -n "${lines[line]}"
	fi
done

#!/bin/bash

arrow_sign=$(printf "\u1b")
lines=("")
line=0
position=0
while true; do
	read -s -r -N1 char
	if [ "$char" = $'\x7f' ] || [ "$char" = $'\x08' ]; then
		if [ $position -ne 0 ]; then
			tput sc
			
			second_part="${lines[line]:position}"
			position=`expr $position - 1`
			first_part="${lines[line]:0:position}"
			lines[line]=$first_part$second_part
			echo -n $'\r'
			tput el
			echo -n "${lines[line]}"
			
			tput rc
			tput cub1 


		elif [ $line -ne 0 ]; then
			tput sc
			
			prev=`expr $line - 1`
			
			position="${#lines[prev]}"
			
			lines[prev]="${lines[prev]}""${lines[line]}"
			
			unset 'lines[line]'
			
			line=`expr $line - 1`
			tput cuu1

			for (( i=$line; i<"${#lines[@]}"; i++ )); do 
				echo -n $'\r'
				tput el
				echo -n "${lines[i]}"
                                echo
			done
			echo -n $'\r'
			tput el

			# tput cuu `expr "${#lines[@]}" - $line`
			
			tput rc
			tput cuu1
			# moveforward=`expr $position - "${#lines[line]}"`
		        if [ $position -gt 0 ]; then
				tput cuf $position
			fi	
		fi

	elif [ "$char" = $'\x12' ]; then
                clear
                echo "Your command: "
                echo
                for l in "${lines[@]}"; do
                        echo "$l"
                done
                echo
                echo "End of your command."
		exit

	elif [ "$char" = $'\n' ]; then
		# tput sc 	
			
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
                        echo -n "${lines[i]}"
			tput cud1 
                done
		moveup=`expr "${#lines[@]}" - $line`
		if [ $moveup -gt 0 ]; then
			tput cuu $moveup
		fi

		# tput rc 
	
	elif [[ $char == $arrow_sign ]]; then
                read -rsn2 mode # read 2 more chars
                case $mode in
                        '[A')
				if [ $line -gt 0 ]; then
					line=`expr $line - 1`
					number_of_chars="${#lines[line]}"
					# position=$(( $position > $number_of_chars ? $number_of_chars : $position ))
					moveleft=$(( $position > $number_of_chars ? `expr $position - $number_of_chars` : 0 ))
					
					tput cuu1
					#tput rc
					#if [ $position -gt 0 ]; then
					#	tput cuf $position
					#fi
					if [ $moveleft -gt 0 ]; then
						position=`expr $position - $moveleft`
						tput cub $moveleft
					fi
				fi;;
                        '[B') 
				if [ $line -lt "${#lines[@]}" ]; then
                                        line=`expr $line + 1`
                                        number_of_chars="${#lines[line]}"
                                        # moveleft=$(( $position > $number_of_chars ? `expr $number_of_chars - $position` : 0 ))
                                        position=$(( $position > $number_of_chars ? $number_of_chars : $position ))
					tput cud1
                                        if [ $position -gt 0 ]; then
                                                # position=`expr $position - $moveleft`
                                                tput cuf $position # $moveleft
                                        fi
                                fi;;
                        '[D')
				if [ $position -gt 0 ]; then
					position=`expr $position - 1`
					tput cub1
				fi;;
                        '[C')
				if [ $position -lt "${#lines[line]}" ]; then
					position=`expr $position + 1`
			        	tput cuf1
				fi;;
                esac
		
                # position=$(( $position > $number_of_chars ? $number_of_chars : $position ))
                # position=$(( $position < 0 ? 0 : $position ))
	else	
		tput sc
		first_part="${lines[line]:0:position}"
		second_part="${lines[line]:position}"
                position=`expr $position + 1`
                lines[line]=$first_part$char$second_part
                tput el
                echo -n $'\r'
                echo -n "${lines[line]}"
		tput rc
		tput cuf1
	fi
done

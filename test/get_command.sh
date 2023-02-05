#!/bin/bash

# Black        0;30     Dark Gray     1;30
# Red          0;31     Light Red     1;31
# Green        0;32     Light Green   1;32
# Brown/Orange 0;33     Yellow        1;33
# Blue         0;34     Light Blue    1;34
# Purple       0;35     Light Purple  1;35
# Cyan         0;36     Light Cyan    1;36
# Light Gray   0;37     White         1;37

RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# cat ./jaskier.txt

#cat "daisy3.txt" | while IFS= read -r line; do
#	echo -e "$line"
#done

# echo "daisy"
#echo "⮟"
# echo "⮮daisy"
echo -e "\n${GREEN}⮮daisy${NC}"
#echo "⯆daisy"
#echo "⮦daisy"

stream_name=$1
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
			lines=("${lines[@]}")
			
			line=`expr $line - 1`
			tput cub $position
			tput cuu1
	
			for l in "${lines[@]:line}"; do 
				tput el
				echo -n "$l"
				tput cud1
			done
			# echo -n $'\r'
			tput el
			
			tput rc
			tput cuu1
		        if [ $position -gt 0 ]; then
				tput cuf $position
			fi	
		fi
	
	elif [ "$char" = $'\x12' ]; then
       	        # 	clear
       	        # 	echo "Your command: "
       	        # 	echo
       	        # 	for l in "${lines[@]}"; do
	#			echo "$l"
       	 #        	done
       	  #       	echo
	#	 	echo "End of your command."
	#		exit
			
		for l in "${lines[@]}"; do
			echo "$l" >> $stream_name
		done	
		exit

	elif [ "$char" = $'\n' ]; then
			
		# Split 
		first_part="${lines[line]:0:position}"
		second_part="${lines[line]:position}"
		lines[line]=$first_part
			
		# Move 
		line=`expr $line + 1`
		position=0
			
		lines=("${lines[@]:0:line}" "$second_part" "${lines[@]:line}")
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
	
	elif [[ $char == $arrow_sign ]]; then
          	read -rsn2 mode 
  	        case $mode in
                  	'[A')
				if [ $line -gt 0 ]; then
					line=`expr $line - 1`
					number_of_chars="${#lines[line]}"
					moveleft=$(( $position > $number_of_chars ? `expr $position - $number_of_chars` : 0 ))
					
					tput cuu1
					if [ $moveleft -gt 0 ]; then
						position=`expr $position - $moveleft`
						tput cub $moveleft
					fi
				fi;;
                      	'[B') 
				if [ $line -lt `expr "${#lines[@]}" - 1` ]; then
                               		line=`expr $line + 1`
                                       	number_of_chars="${#lines[line]}"
                                       	position=$(( $position > $number_of_chars ? $number_of_chars : $position ))
					tput cud1
                               		if [ $position -gt 0 ]; then
                                               	tput cuf $position 
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


set! x 3

for i in 0..n
   print(3)

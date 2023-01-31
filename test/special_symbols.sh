#!/bin/bash

special_symbol () {
	text=$1
	i=$(("${#text}" - 1))
	word=""
	while [ $i -ge 0 ]; do
		char="${text:$i:1}"
		if [ "$char" = $'\x5c' ]; then # \
			echo "$word $i"
		elif [ "$char" = $'\x20' ]; then # space
			exit
		else
			word=$char$word
		fi
		i=$((i - 1))
	done 
}

special_symbol "$1"





arrow_sign=$(printf "\u1b")
repl_text=""
position=0
while true; do
	number_of_lines=`echo "$repl_text" | wc -l`
	number_of_chars="${#repl_text}"
	echo -n "$repl_text"; read -s -r -N1 char; echo 




	if [ "$char" = $'\x7f' ] || [ "$char" = $'\x08' ]; then 
		if [ "${#repl_text}" -ne 0 ]; then
			#repl_text="${repl_text::-1}"
			second_part="${repl_text:position}"
			position=`expr $position - 1`
			first_part="${repl_text:0:position}"
                	repl_text=$first_part$second_part
		fi

	#elif [ "$char" = ' ' ]; then
	#	repl_text=$repl_text" "
	#elif [ "$char" = $'\n' ]; then
	#	repl_text=$repl_text$char
	#




	elif [[ $char == $arrow_sign ]]; then
    		read -rsn2 mode # read 2 more chars
		case $mode in
    			# '[A') echo UP ;;
    			# '[B') echo DN ;;
    			'[D') position=`expr $position - 1` ;;
    			'[C') position=`expr $position + 1` ;;
		esac

		position=$(( $position > $number_of_chars ? $number_of_chars : $position ))
		position=$(( $position < 0 ? 0 : $position ))
	else 
		# whatwhere='s/.\{'$position'\}/&'`echo $char`'/'
		#repl_text=`echo $repl_text | sed $whatwhere`
		first_part="${repl_text:0:position}"
		second_part="${repl_text:position}"
		repl_text=$first_part"${char}"$second_part
		
		position=`expr $position + 1`
		# repl_text=$repl_text$char
	fi 	


	for i in $(seq `expr $number_of_lines`); do
		tput cuu1
		tput el
	done
done



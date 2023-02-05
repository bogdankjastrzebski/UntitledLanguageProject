
function read_eval_print_loop()
	run(`/bin/bash "./print_logo.sh"`)	
	# run(`/bin/bash "cat "daisy2.txt" | while IFS= read -r line; do echo -e '$line'; done"`)
	f = open("repl_stream", "r")
	read(f, String) 
	while true
		run(`/bin/bash -c "./get_command.sh repl_stream"`)
		command = read(f, String)
		if strip(command) == "exit()"
			break
		end
		println("-----------------")
		print(command)
		println("#################")
	end
	close(f)	
end

 # ;ls 

read_eval_print_loop()


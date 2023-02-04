
function read_eval_print_loop()
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


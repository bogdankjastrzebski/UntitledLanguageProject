using UntitledLanguage
import UntitledLanguage: create_lambda, val

function to_SExpr(t::Tuple)
    return SExpr(to_SExpr.(t))
end

function to_SExpr(s::Union{String, SubString})
    t = tryparse(Int64, s)
    if !(t isa Nothing)
        return Atom(t)
    end
    
    t = tryparse(Float64, s)
    if !(t isa Nothing)
        return Atom(t)
    end
    
    return Atom(Symbol(s))
end

function create_lambda(ast, env)
    body = ast.expr[3]
    if ast.expr[2] isa Atom
        name = val(ast.expr[2])
        return (args...) -> ast_walk(
            ast.expr[3],
            env = Environment(Dict{Symbol, Any}(name => args), env)
        )
    else
        names = val.(ast.expr[2].expr)
        return (args...) -> ast_walk(
            ast.expr[3], 
            env = Environment(env, names, args)
        )
    end
end

function split_comma(arr)
    @assert isodd(length(arr))
    @assert all(==(Atom(Symbol(","))).(arr[2:2:end]))
    return arr[1:2:end]
end

BUILTINS = () -> Dict{Symbol, Any}(
    :__println__ => (txt -> printstyled(txt, '\n', color=:light_blue)),
    :add => (+),
    :mul => (*),
    :+ => (+),
    :* => (*),
    :is => (===),
    :(=) => (==),
    :> => (>),
    :< => (<), 
    :≥ => (≥), 
    :≤ => (≤),
    :list => (args...) -> SExpr(args),
    :__nl__ => Macro((args...) -> SExpr(args)),
    :__call__ => Macro((args...) -> se(args[1], split_comma(args[2:end])...)),
    :__tuple__ => Macro((args...) -> SExpr(args)),
    :lambda_ => Macro((args...) -> SExpr((at(:lambda), SExpr(args[1].expr[2:end]), args[2]))), 
    :print => Macro((args...) -> se(:__println__, args...))
)

function read_eval_print_loop()
	run(`/bin/bash "./print_logo.sh"`)	
	
	# Open Stream 
	f = open("repl_stream", "r")
	read(f, String) # Clear what was in it.

	# Create Environment
	env = Environment(BUILTINS())

	# Loop 
	while true
		run(`/bin/bash -c "./get_command.sh repl_stream"`)
		command = read(f, String)
		if strip(command) == "exit()"
			break
		end
		
		println()
		ast_walk(to_SExpr(parser(command)),env=env)

		# println("-----------------")
		# print(command)
		# println("#################")
	end

	# Close Stream
	close(f)	
end

 # ;ls 

read_eval_print_loop()


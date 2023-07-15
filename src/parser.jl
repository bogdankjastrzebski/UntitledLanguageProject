

SEPARATED_SYMBOLS = [
    "+" => "__plus__",
    "-" => "__minus__",
    "*" => "__asterisk__",
    "/" => "__slash__",
    "^" => "__circumflex_accent__", 
    "=" => "__equal_sign__",
    ">" => "__greater_than_sign__",
    "<" => "__less_than_sign__",
    ":" => "__colon__", 
    ";" => "__semicolon__",
   ".." => "__double_dot__",
    "." => "__dot__", 
    "," => "__comma__", 
]

CALLS = [
    ("(", ")", "__call__"),
    ("[", "]", "__index__"),
]

function to_line_tokens(str)
    lines = split(str, '\n')
    # return collect(zip((x -> x isa Nothing ? 1 : x).(findfirst.(!=(' '), lines)), split.(lines)))
    return [(-1, ["begin"]), [e for e in collect(zip(findfirst.(!=(' '), lines), split.(lines))) if !(e[1] isa Nothing)]...]
end

function get_brackets!(line)
    c = 0
    ret = []
    while !isempty(line)
        if line[1] == "("
            popfirst!(line)
            push!(ret, get_brackets!(line))
        elseif line[1] == ")"
            popfirst!(line)
            break
        else
            push!(ret, popfirst!(line))
        end
    end
    return (ret...,)
end

function get_block!(lines)
    
    h, ts = popfirst!(lines)
    ts = get_brackets!(ts)
    if isempty(lines) || lines[1][1] <= h
        return ("__nl__", ts...) 
    end
        
    # Check if the __begin__ block should be added 
    hmin = lines[1][1]
    i = 1
    while i <= length(lines) &&  h < lines[i][1]
        hmin = min(lines[i][1], hmin)
        i += 1
    end 
    if hmin < lines[1][1]
        pushfirst!(lines, (hmin, [SubString("__begin__")]))
    end
    
    # Add Blocks
    blocks = Any[]
    while !isempty(lines) && lines[1][1] > h
        push!(blocks, get_block!(lines))
    end
    return ("__nl__", ts..., blocks...)

end 

function parser(str)
    converge(f, xₙ) = (xₙ₊₁ = f(xₙ); xₙ₊₁ == xₙ ? xₙ₊₁ : converge(f, xₙ₊₁))
    rs__sepsym__ = r"(\S)([\+\-\*\/\^\@\=\>\<\:\;\,]|(\.\.))" => s"\1 \2 "
    rs__sepsymbegin__ = r"(^|\s)([\+\-\*\/\^\@\=\>\<\:\;\,])" => s"\1\2 "
    rs__tuple__  = r"(^|[\(\[\s\.])(?<rec>\((?!\s__tuple__)(?<n>(?>[^\(\)]+|\g<rec>?)+)\))" => s"\1( __tuple__ \g<n> )"
    rs__list__   = r"(^|[\(\[\s\.])(?<rec>\[(?<n>(?>[^\[\]]+|\g<rec>?)+)\])" => s"\1( __list__ \g<n> )"
    rs__call__   = r"(?<l>(?<rec0>\((?>[^\(\)\[\]]+|\g<rec0>|\g<rec1>?)+\))|(?<rec1>\[(?>[^\(\)\[\]]+|\g<rec0>|\g<rec1>?)+\])|[^\(\)\[\]\s\.]+)(?<rec2>\((?<j>(?>[^\(\)]+|\g<rec2>?)+)\))" => s"( __call__ \g<l> \g<j> )"
    rs__index__  = r"(?<l>(?<rec0>\((?>[^\(\)\[\]]+|\g<rec0>|\g<rec1>?)+\))|(?<rec1>\[(?>[^\(\)\[\]]+|\g<rec0>|\g<rec1>?)+\])|[^\(\)\[\]\s\.]+)(?<rec2>\[(?<j>(?>[^\[\]]+|\g<rec2>?)+)\])" => s"( __index__ \g<l> \g<j> )"
    rs__dot__ = r"(?<l>(?<rec>\((?>[^\(\)]+|\g<rec>?)+\))|[^\(\)\s\.]+)\.(?<r>\g<rec>|[^\(\)\s\.]+)" => s"( __dot__ \g<l> \g<r> )"
    return @pipe str |> 
        replace(_, rs__sepsymbegin__) |>
        replace(_, rs__sepsym__) |>
        converge(t -> replace(t, rs__tuple__), _) |> 
        converge(t -> replace(t, rs__list__), _) |> 
        converge(t -> replace(t, rs__index__), _) |>
        converge(t -> replace(t,  rs__call__), _) |> 
        converge(t -> replace(t,   rs__dot__), _) |> 
        to_line_tokens |> 
        get_block!
end

function pretty_str(ast::Union{String, SubString}, height=0, indent=3)
    return ast
end

function pretty_str(ast, height=0, indent=3)
    return @match ast[1] begin
        "__nl__" => '\n' * ' '^height * join(pretty_str.(ast[2:end], height+indent, indent), ' ')
        "__call__"  => pretty_str(ast[2], height, indent) * "(" * join(pretty_str.(ast[3:end], height, indent), ' ') * ")"
        "__index__" => pretty_str(ast[2], height, indent) * "[" * join(pretty_str.(ast[3:end], height, indent), ' ') * "]"
        "__tuple__" => "(" * join(pretty_str.(ast[2:end], height, indent), ' ') * ")"
        "__list__" => "[" * join(pretty_str.(ast[2:end], height, indent), ' ') * "]"
        "__dot__" => pretty_str(ast[2], height, indent) * '.' * pretty_str(ast[3], height, indent)
    end
end

function pretty_print(ast, height=0, indent=3)
    print(pretty_str(ast, height, indent))
end

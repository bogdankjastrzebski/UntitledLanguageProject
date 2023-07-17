struct Environment  
    names::Dict{Symbol, Any}
    outer::Union{Environment, Nothing}
    function Environment()
        return new(Dict{Symbol, Any}(), nothing)
    end
    function Environment(outer::Environment)
        return new(Dict{Symbol, Any}(), outer)
    end
    function Environment(names::Dict{Symbol, Any})
        return new(names, nothing)
    end
    function Environment(names, outer)
        return new(names, outer)
    end
    function Environment(outer, keys, values)
        return new(Dict{Symbol, Any}(zip(keys, values)), outer)
    end
end

function (e::Environment)(name)
    if name in keys(e.names)
        return e.names[name]
    elseif !(e.outer isa Nothing)
        return e.outer(name)
    else
        error("Error: $name not defined")
    end
end

function setindex!(e::Environment, value, name::Symbol)
    e.names[name] = value
    return nothing
end


struct Atom{T}
    val::T
end
function val(a::Atom)
    return a.val
end
struct SExpr
    expr::Tuple
end
struct Macro{T}
    func::T
end
function (m::Macro)(args...)
    return m.func(args...)
end
function atomtype(a::Atom{T}) where T
    return T
end
function se(args...)
    return SExpr((x -> x isa Atom || x isa SExpr ? x : Atom(x)).(args))
end
function at(arg)
    return Atom(arg)
end

BUILTINS = Dict{Symbol, Any}(
    :+ => (+),
    :* => (*),
    :is => (===),
    :(=) => (==),
    :> => (>),
    :< => (<), 
    :≥ => (≥), 
    :≤ => (≤),
    :list => (args...) -> SExpr(args),
)

function create_lambda(ast, env)
    body = ast.expr[3]
    names = ast.expr[2] isa Atom ? (ast.expr[2],) : val.(ast.expr[2].expr)
    return (args...) -> ast_walk(
        ast.expr[3], 
        env = Environment(env, names, args)
    )
end

function ast_walk(ast::SExpr; env=Environment(BUILTINS))
    @match ast.expr[1] begin
        at(:lambda) => create_lambda(ast, env)
        at(:macro)  => Macro(create_lambda(ast, env))
        at(:quote)  => ast.expr[2]
        at(:if)     => if ast_walk(ast.expr[2], env=env)
                ast_walk(ast.expr[3], env=env)
            else
                ast_walk(ast.expr[4], env=env)
            end
        at(:begin)  => begin
            for a in ast.expr[2:end-1]
                ast_walk(a, env=env)
            end
            ast_walk(ast.expr[end], env=env)
        end
        at(:set!)   => (env[val(ast.expr[2])] = ast_walk(ast.expr[3], env=env))
        _ => begin
            item = ast_walk(ast.expr[1], env=env)
            @match item begin
                _::Function => item(ast_walk.(ast.expr[2:end], env=env)...)
                _::Macro    => ast_walk(item(ast.expr[2:end]...), env=env)
                _ => error("Error: $item not callable")
            end
        end
    end
end
function ast_walk(ast::Atom; env=DEFAULT_ENV)
    return atomtype(ast) == Symbol ? env(ast.val) : ast.val
end

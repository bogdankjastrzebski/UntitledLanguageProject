
abstract type __AbstractExpression__ end
abstract type __AbstractEnvironment__ end

struct __Symbol__ <: __AbstractExpression__
    str::String
end

struct __Abstraction__ <: __AbstractExpression__
    argname::__Symbol__
    code::__AbstractExpression__
end

struct __Application__ <: __AbstractExpression__
    operator::__AbstractExpression__
    operand::__AbstractExpression__
end

struct __Lambda__
    argname::__Symbol__
    code::__AbstractExpression__
    env::__AbstractEnvironment__
end

struct __NullEnvironment__ <: __AbstractEnvironment__ end
struct __FullEnvironment__ <: __AbstractEnvironment__
    name::__Symbol__
    value::__Lambda__
    outer::__AbstractEnvironment__
end

Base.show(io::IO, me::__Symbol__) = print(io, me.str)
Base.show(io::IO, me::__Application__) = print(io, "($(me.operator) $(me.operand))")
Base.show(io::IO, me::__Abstraction__) = print(io, "(λ $(me.argname) . $(me.code))")
Base.show(io::IO, me::__Lambda__) = print(io, "(λ $(me.argname) . $(me.code))[$(me.env)]")
Base.show(io::IO, me::__NullEnvironment__) = print(io, "Nil")
Base.show(io::IO, me::__FullEnvironment__) = (
    val = replace("$(me.value)", r"\[.*\]" => ""); print(io, "$(me.name): $(val), $(me.outer)"))

(λ::__Lambda__)(arg) = evaluate(λ.code, __FullEnvironment__(λ.argname, arg, λ.env))

(env::__NullEnvironment__)(name) = error("No variable named \"$(name)\".")
(env::__FullEnvironment__)(name) = name == env.name ? env.value : env.outer(name)

evaluate(symbol::__Symbol__, env::__AbstractEnvironment__) = env(symbol)
evaluate(a::__Abstraction__, env::__AbstractEnvironment__) = __Lambda__(a.argname, a.code, env)
evaluate(a::__Application__, env::__AbstractEnvironment__) = evaluate(a.operator, env)(evaluate(a.operand, env))

macro S_str(string)
    return :(__Symbol__($string))
end

function L(name, code)
    __Abstraction__(name, code)
end

function C(rator, rand)
    __Application__(rator, rand)
end

macro λ(name, code)
    :(__Abstraction__($name, $code))
end

macro γ(rator, rand)
    :(__Application__($rator, $rand))
end

macro γ(rator, rand, rest...)
    s = :(__Application__($rator, $rand))
    for r in rest
        s = :(__Application__($s, $r))
    end
    return s
end

function econs(env, name::__Symbol__, value::__Lambda__)
    return __FullEnvironment__(name, value, env)
end

# Lib
env = __NullEnvironment__()
env = econs(env, S"#t", evaluate((@λ S"x" (@λ S"y" S"x")), env))
env = econs(env, S"#f", evaluate((@λ S"x" (@λ S"y" S"y")), env))
env = econs(
    env,
    S"cons", 
    evaluate((@λ S"car" (@λ S"cdr" (@λ S"ind" (@γ S"ind" S"car" S"cdr")))), env)
)
env = econs(
    env,
    S"car",
    evaluate((@λ S"cons" (@γ S"cons" S"#t")), env)
)
env = econs(
    env,
    S"cdr",
    evaluate((@λ S"cons" (@γ S"cons" S"#f")), env)
)
env = econs(
    env,
    S"0",
    evaluate((@λ S"f" (@λ S"x" S"x")), env),
)
env = econs(
    env,
    S"incr",
    evaluate((@λ S"num" (@λ S"f" (@λ S"x" (@γ S"f" (@γ S"num" S"f" S"x"))))), env)
)
for i in 1:16
    env = econs(
        env,
        __Symbol__(string(i)),
        evaluate(C(S"incr", __Symbol__(string(i-1))), env)
    )
end


x = __Abstraction__(__Symbol__("x"), __Symbol__("x"))
y = __Application__(x, x)

x = L(S"x", S"x")
y = C(x, x)

x = (@λ S"x" (@γ (@λ S"x" S"x") S"x"))
y = (@γ x (@λ S"x" S"x"))

evaluate(y, __NullEnvironment__())

x = (@γ S"car" (@γ S"cons" S"#t" S"#f"))
evaluate(x, env)

x = (@γ  S"incr" S"1")
evaluate(x, env)


# Parser
function get_expr!(sss)
    if first(sss) == "("
        popfirst!(sss)
        expr = []
        while first(sss) != ")"
            push!(expr, get_expr!(sss))
        end
        popfirst!(sss)
        return expr
    else
        return popfirst!(sss)
    end
end
        
    
function lispparse(str)
    str = replace(str, "(" => " ( ")
    str = replace(str, ")" => " ) ")
    sss = split(str, ' ')
    return sss
end






    


abstract type __AbstractValue__ end
abstract type __AbstractList__ <: __AbstractValue__ end
abstract type __AbstractEnvironment__ <: __AbstractValue__ end
abstract type __AbstractBuiltin__ <: __AbstractValue__ end

struct __Symbol__ <: __AbstractValue__
    str::String
end

# struct __Lambda__ <: __AbstractValue__
#     argname::__Symbol__
#     code::__AbstractValue__
#     env::__AbstractEnvironment__
# end

struct __Macro__ <: __AbstractValue__
    argname::__Symbol__
    code::__AbstractValue__
    env::__AbstractEnvironment__
end

struct __Nil__ <: __AbstractList__ end
struct __Cons__ <: __AbstractList__
    value::__AbstractValue__
    next::__AbstractList__
end

struct __NullEnvironment__ <: __AbstractEnvironment__ end
struct __FullEnvironment__ <: __AbstractEnvironment__
    name::__Symbol__
    value::__AbstractValue__
    outer::__AbstractEnvironment__
end

struct __Evaluate__ <: __AbstractBuiltin__
    env::__AbstractEnvironment__
end

struct __BuiltinMacro__{T} <: __AbstractBuiltin__
    func::T
end


Base.show(io::IO, me::__Symbol__) = print(io, me.str)
# Base.show(io::IO, me::__Lambda__) = print(io, "(λ $(me.argname) . $(me.code))[$(me.env)]")
Base.show(io::IO, me::__Macro__) = print(io, "(γ $(me.argname) . $(me.code))[$(me.env)]")
list_content(me::__Nil__) = ""
list_content(me::__Cons__) = "$(me.value) $(list_content(me.next))"
Base.show(io::IO, me::__AbstractList__) = print(io, "(", list_content(me)[1:end-1], ")")
Base.show(io::IO, me::__NullEnvironment__) = print(io, "Nil")
Base.show(io::IO, me::__FullEnvironment__) = (
    val = replace("$(me.value)", r"\[.*\]" => ""); print(io, "$(me.name): $(val), $(me.outer)"))

# (λ::__Lambda__)(arg) = evaluate(λ.code, __FullEnvironment__(λ.argname, arg, λ.env))
(μ::__Macro__)(arg, env) = evaluate(μ.code,
    __FullEnvironment__(μ.argname, arg,
    __FullEnvironment__(__Symbol__("eval"), __Evaluate__(env),
    μ.env))
)
(env::__NullEnvironment__)(name) = error("No variable named \"$(name)\".")
(env::__FullEnvironment__)(name) = name == env.name ? env.value : env.outer(name)
(eval::__Evaluate__)(x, env) = evaluate(x, eval.env)
(func::__BuiltinMacro__)(x, env) = func.func(x, env)

evaluate(symbol::__Symbol__, env::__AbstractEnvironment__) = env(symbol)
evaluate(a::__Cons__, env::__AbstractEnvironment__) = evaluate(a.value, env)(a.next, env)

make_macro = __BuiltinMacro__((arg, env) -> __Macro__(arg, , env))

function get_expr!(sss)
    if first(sss) == "("
        popfirst!(sss)
        expr = __Nil__()
        while first(sss) != ")"
            expr = __Cons__(get_expr!(sss), expr)
        end
        popfirst!(sss)
        # Reverse 
        result = __Nil__()
        while !(expr isa __Nil__)
            result = __Cons__(expr.value, result)
            expr = expr.next
        end
        return result
    else
        return __Symbol__(String(popfirst!(sss)))
    end
end
function lispparse(str)
    str = replace(str, "(" => " ( ")
    str = replace(str, ")" => " ) ")
    sss = split(str)
    return get_expr!(sss)
end

example = "(lambda (x) (x x))"

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








    

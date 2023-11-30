
abstract type __AbstractLambda__ end
abstract type __AbstractOperand__ <: __AbstractLambda__ end
abstract type __AbstractOperation__ <: __AbstractLambda__ end

abstract type __AbstractSymbol__ <: __AbstractOperand__ end
abstract type __AbstractList__ <: __AbstractOperand__ end
abstract type __AbstractEnvironment__ <: __AbstractOperand__ end

struct __Symbol__ <: __AbstractSymbol__
    str::String
end

struct __Nil__ <: __AbstractList__ end
struct __Cons__ <: __AbstractList__ 
    car::__AbstractLambda__
    cdr::__AbstractList__
end

struct __Lambda__
    argname::__Symbol__
    code::Union{__Symbol__, __Cons__}
    env::__AbstractEnvironment__
end

struct __NullEnvironment__ <: __AbstractEnvironment__ end
struct __FullEnvironment__ <: __AbstractEnvironment__
    name::__Symbol__
    value::__Lambda__
    outer::__AbstractEnvironment__
end

Base.show(io::IO, me::__Symbol__) = print(io, me.str)
Base.show(io::IO, me::__Nil__) = print(io, "")
Base.show(io::IO, me::__Cons__) = if me.cdr isa __Nil__
    print(io, "$(me.car))")
elseif me.cdr.car isa __Symbol__ 
    print(io, "$(me.car) $(me.cdr)")
else
    print(io, "$(me.car) ($(me.cdr)")
end
Base.show(io::IO, me::__Lambda__) = print(io, "(λ $(me.argname) . $(me.code))[$(me.env)]")
Base.show(io::IO, me::__NullEnvironment__) = print(io, "Nil")
Base.show(io::IO, me::__FullEnvironment__) = (
    val = replace("$(me.value)", r"\[.*\]" => ""); print(io, "$(me.name): $(val), $(me.outer)"))

(λ::__Lambda__)(arg) = evaluate(λ.code, __FullEnvironment__(λ.argname, arg, λ.env))

(env::__NullEnvironment__)(name) = error("No variable named \"$(name)\".")
(env::__FullEnvironment__)(name) = name == env.name ? env.value : env.outer(name)

evaluate(symb::__Symbol__, env::__AbstractEnvironment__) = env(symb)
function evaluate(expr::__Cons__, env::__AbstractEnvironment__)
    if expr.car == __Symbol__("lambda")
        __Lambda__(expr.cdr.car, expr.cdr.cdr.car, env)
    else
        car = expr.car
        cdr = expr.cdr
        while true
            car = evaluate(car, env)(evaluate(cdr.car, env))
            cdr = cdr.cdr
            if cdr isa __Nil__
                break
            end
        end
        car
    end
end
evaluate(expr::__Lambda__, env) = expr
evaluate(expr::Tuple, env) = evaluate(to_expr(expr), env)

to_expr(x::__Symbol__) = x
to_expr(x::__Nil__) = x
to_expr(x::__Cons__) = __Cons__(to_expr(x.car), to_expr(x.cdr))
to_expr(x::String) = __Symbol__(x)
to_expr(x::Symbol) = __Symbol__(string(x))
to_expr(x::Tuple) = length(x) == 0 ? __Nil__() : __Cons__(to_expr(x[1]), to_expr(x[2:end]))

function make_env(values)
    env = __NullEnvironment__()
    for (name, value) in values
        env = __FullEnvironment__(
            to_expr(name), evaluate(to_expr(value), env), env,
        )
    end 
    return env
end

# Make Environment
env = make_env((
    "#t" => (:lambda, :x, (:lambda, :y, :x)),
    "#f" => (:lambda, :x, (:lambda, :y, :y)),
    "cons" => (:lambda, :car, (:lambda, :cdr, (:lambda, :pred, (:pred, :car, :cdr)))),
    "car" => (:lambda, :cons, (:cons, "#t")),
    "cdr" => (:lambda, :cons, (:cons, "#f")),     
    "incr" => (:lambda, :num,
                (:lambda, :f,
                  (:lambda, :x, 
                    (:f, (:num, :f, :x)))))
))

__lh(n::Int) = n == 0 ? :x : (:f, __lh(n - 1))
lambda(n::Int) = (:lambda, :f, (:lambda, :x, __lh(n)))   




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


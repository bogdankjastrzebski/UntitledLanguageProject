using LinearAlgebra
using Zygote
using UnicodePlots
import Base.^


function power(x)
    return log(one(x) + x)
end

function rewop(x)
    return exp(x) - one(x)
end

function (^)(f::typeof(power), k::Int)
    return k == 0 ? identity : power^(k-1) ∘ power
end

function (^)(f::typeof(rewop), k::Int)
    return k == 0 ? identity : rewop^(k-1) ∘ rewop
end

function average(f, p, a=0, b=1)
    return (1.0-p)*f(a) + p*f(b)
end

k = 4
lineplot(0, 1,
         p -> (rewop^k)(average(power^k, p)))

function average(f, p, a=0, b=1)
    return p(a,a)*f(a,a) + p(a,b)*f(a,b) + 
           p(b,a)*f(b,a) + p(b,b)*f(b,b)
end

remove_inf(x) = x == Inf ? maxintfloat() : x 

k = 0
hyper = (x, y) -> Dict((0, 0) => 0.5, (0, 1) => 1.0,
                       (1, 0) => 1.0, (1, 1) => 0.0)[(x,y)]
heatmap([
  (power^0 ∘ rewop^0)(average(power^k ∘ hyper,
                   (x, y) -> p^x * (1-p)^(1-x) * q^x * (1-q)^(1-x)))
  for p in 0:(1/39):1, q in 0:(1/39):1
])







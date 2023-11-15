using Zygote
using LinearAlgebra
using Distributions


n = 100
k = 10
λ = 0.1
Q = randn(k, k);
X = randn(n, k)*(Q'Q + λ*I);
β = sign.(randn(k));
Y = sign.(X*β);

function sample_concrete(p, τ)
    return [cdf(Normal(0, sqrt(τ)), invlogcdf(Normal(0, 1), log(p)) + sqrt(1 - τ)*randn()) for p in p]
end

function loss_function(τ)
    function inner(p)
        e = 2sample_concrete(p, τ) .- 1
        return -log(0.001 + mean((Y - tanh.(X * e / sqrt(length(e) - e'e + 0.001))).^2))^10
    end
    return inner
end

p = rand(k)
loss = loss_function(0.1)
α = 0.01

for i in 1:10000
    # @show p
    p_old = p
    p -= α * mean([loss'(p) for _ in 1:10])
    p .= min.(max.(0.01, p), 0.99)
    println(loss(p))
    if p_old == p
        break
    end
end

[β 1 .- 2p]

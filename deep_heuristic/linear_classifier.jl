using Zygote
using LinearAlgebra
using Distributions
import Base.^

n = 100
k = 30
λ = 0.1
Q = randn(k, k);
X = randn(n, k)*(Q'Q + λ*I);
β = sign.(randn(k));
Y = sign.(X*β);

function sample_concrete(p, n, τ)
    return cdf(Normal(0, sqrt(τ)), invlogcdf(Normal(0, 1), log.(p))' .+ sqrt(1 - τ)*randn(n, length(p)))
end

power(x) = log(1.0 + x)
(^)(x::typeof(power), k::Int64) = k == 0 ? identity : power^(k-1) ∘ power

function loss_function(X, Y, τ, n)
    function inner(p)
        k = size(p, 1)
        ϵ = 0.001
        E = 2sample_concrete(p, n, τ) .- 1
        P = tanh.(X * E' ./ .√(ϵ + k .- sum(E.^2, dims=2))')
        # @show size(E)
        # @show size(X * E')
        # @show size(.√(ϵ + k .- sum(E.^2, dims=2)))
        # @show size(P)
        # @show size(Y)
        return mean( (power^10).(mean((Y .- P).^2, dims=1)) )
        # return log(0.001 + mean((Y - tanh.(X * e' / sqrt(length(e) - e'e + 0.001))).^2))^5
    end
    return inner
end

p = 0.4 .+ 0.2rand(k)
loss = loss_function(X, Y, 0.1, 32)

α = 0.05
for i in 1:10000
    # @show p
    p_old = p
    # p -= α * sign.(mean([loss'(p) for _ in 1:10]))
    p -= α * sign.(loss'(p))
    p .= min.(max.(0.01, p), 0.99)
    # println(loss(p))
    println(mean(sign.(1 .- 2p) .!= β))
    if p_old == p
        break
    end
end

[β (1 .- 2p)]

mean(sign.(1 .- 2p) .!= β)

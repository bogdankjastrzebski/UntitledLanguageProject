
using LinearAlgebra
using Zygote
using StatsBase


function e(f, p)
    if length(p) == 1
        return @inbounds p[1]*f[1] + (one(eltype(p)) - p[1])*f[2]
    end
    return @inbounds p[1]*e(f[1,[(:) for i in 1:length(p)-1]...],p[2:end]) +
              (1-p[1]) * e(f[2, [(:) for i in 1:length(p)-1]...],p[2:end])
end

loss = x -> e(f, x)

n = 10
f = rand([3 for _ in 1:n]...);

k = 16
ft = f.^k
losst = x -> e(ft, x)^(1/k)

fl = log.(f)
losslog = x -> exp(e(fl, x))

fl2 = -log.(f).^2
lossl2 = x -> exp(-sqrt(-e(fl2, x)))

loss = x -> e(f, x)

# p = ([rand() for i in 1:n]...,)
function opt(loss_true, loss, n, α=0.01, max_iter=1000)
    p = 0.5 .+ 0.1rand(n)
    α = 0.01
    # L = []
    for i in 1:max_iter
        op = p
        p -= α * sign.(loss'(p))
        p = min.(max.(p, 0), 1)
        # push!(L, loss_true(p))
        # @show p
        if op == p
            break
        end
    end
    println()
    l = loss_true(p)
    @show p
    @show l 
    return l
end


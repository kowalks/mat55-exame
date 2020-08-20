using Plots

include("algorithms.jl")
include("pdbParser.jl")

dfA = pdbParser("./data/5r80.pdb")
dfB = pdbParser("./data/5r83.pdb")

A = convert(Matrix, dfA[1:3])
B = convert(Matrix, dfB[1:3])

m,n = size(A)

pyplot()
anim = @animate for i ∈ -12:24
    scatter(A[1:m,1], A[1:m,2], A[1:m,3], camera=(10*i,10*i))
end
gif(anim, "animation.gif", fps = 10)

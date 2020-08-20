using LinearAlgebra

function rmsd(A::Matrix{Float64}, B::Matrix{Float64})
    # Ensures same length matrices
    if (size(A) != size(B))
        error("Matrices doesn't have the same length.")
    end
    
    m,n = size(A)
    Ac = Array{Float64,1}(undef, n)
    Bc = Array{Float64,1}(undef, n)
    
    # Compute geometric center
    for i ∈ 1:n
        Ac[i] = sum(A[1:m, i])/m
        Bc[i] = sum(B[1:m, i])/m
    end
    
    # Translate A and B to the origin
    Im = ones(m,1)
    A = A - Im*Ac'
    B = B - Im*Bc'
        
    # Compute RMSD
    F = svd(B'*A)
    Q = F.U*F.Vt
    RMSD = norm(A - B*Q, 2)/sqrt(m)
    
    return Q, RMSD
end

# A = [-1 -1 -2;-1 -1 0;-1 1 -2;-1 1 0; 1 -1 -2; 1 -1 0;1 1 -2; 1 1 0.0]
# B = [1 1 0;1 -1 0; -1 1 0; -1 -1 0;1 1 2;1 -1 2; -1 1 2; -1 -1 2.0]
# rmsd(A,B)

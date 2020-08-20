using LinearAlgebra

function pdbParser(str::String) 
    io = open(str, "r")
    s = read(io, String)
    print(s)
end

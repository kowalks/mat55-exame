using LinearAlgebra, DataFrames

function pdbParser(str::String) 
    df = DataFrame(x = Float64[], y = Float64[], z = Float64[], symbol = String[])
    file = open(str, "r")
    lines = readlines(file)
    
    for line ∈ lines
        words = split(line)
        if (words[1] == "ATOM" || words[1] == "HETATM")
            len = length(words)
            
            # Get and parse coordinates
            scoordinates = words[len-5:len-2]
            (x,y,z) = map(x->parse(Float64,x), scoordinates)
            
            # Get atom symbol
            sym = words[len]
    
            push!(df, (x,y,z,sym))
        end
    end
    
    return df
end

# file = "./data/5r80.pdb"
# df = pdbParser(file)


function prompt()
    println("Please enter length of short side A if possible, if not leave blank")
    a = readline()
    println("Please enter length of short side B if possible, if not leave blank")
    b = readline()
    println("Please enter length of Hypotinous C if possible, if not leave blank")
    c = readline()

    all_val = a,b,c

    all_val = [all_val[i] == "" ?  missing : all_val[i] for i in 1:length(all_val)]

    if sum(x -> ismissing(x), all_val) == 1
        nothing
    else
        println("Error: too many or too few missing values.")
    end

    all_v = []
    for i in 1:size(all_val,1)
        if  ismissing(all_val[i])
            push!(all_v, missing)
        else
            push!(all_v, parse(Float64,all_val[i]) )
        end
    end

    return all_v

end

all_v = prompt()

function Pythag(inp::Array{Any,1})
    if ismissing(inp[3])
        result = sqrt(inp[1]^2 + inp[2]^2)
    else
        vals = collect(skipmissing(inp))
        result = sqrt( vals[2]^2 - vals[1]^2 )
    end
    return result
end

println("The length of the missing side is: $(Pythag(all_v))")

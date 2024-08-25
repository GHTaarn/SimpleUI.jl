"""
    promptget(promptstr::AbstractString, default=nothing)
    promptget(type::DataType, promptstr::AbstractString, default=nothing)

Prompt the user with `promptstr` and return the user input.
If the user inputs the empty string and `default != nothing` then `default` is
returned.
Otherwise, if `type==String` then the user input is returned, otherwise the user
input is parsed as `type`. If `type` is not specified, then it is assumed to be
`String`.
"""
function promptget(type::DataType, promptstr::AbstractString, default=nothing)
    default == nothing ? print("$promptstr: ") : print("$promptstr ($default): ")
    input = readline()
    if isempty(input) && !isnothing(default)
        default
    elseif type == String
        input
    else
        try
            parse(type, input)
        catch e1
            println("Error encountered: ", e1)
            promptget(promptstr, default; type)
        end
    end
end

promptget(promptstr::AbstractString, default=nothing) = promptget(String, promptstr, default)

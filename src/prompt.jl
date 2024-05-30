"""
    prompt(promptstr::AbstractString, default::Union{AbstractString,Nothing}=nothing)

Prompt the user with `promptstr` and return the user input as a `String`.
If the user inputs the empty string and `default != nothing` then `default` is
returned.
"""
function prompt(promptstr::AbstractString, default::Union{AbstractString,Nothing}=nothing)
    default == nothing ? print("$prompstr: ") : print("$promptstr ($default): ")
    input = readline()
    isempty(input) && !isnothing(default) ? default : input
end

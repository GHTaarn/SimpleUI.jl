"""
    promptget(promptstr::AbstractString, default::Union{AbstractString,Nothing}=nothing)

Prompt the user with `promptstr` and return the user input as a `String`.
If the user inputs the empty string and `default != nothing` then `default` is
returned.
"""
function promptget(promptstr::AbstractString, default::Union{AbstractString,Nothing}=nothing)
    default == nothing ? print("$promptstr: ") : print("$promptstr ($default): ")
    input = readline()
    isempty(input) && !isnothing(default) ? default : input
end

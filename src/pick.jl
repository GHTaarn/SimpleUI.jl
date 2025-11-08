using REPL.TerminalMenus: request, MultiSelectMenu

"""
    pick([msg::AbstractString,] options::Vector{<:AbstractString}; default=1, kwargs...)

Interactively display a message `msg` and a menu consisting of `options`
and then return the indices of the chosen options.

This function uses `TerminalMenus.MultiSelectMenu` from the `REPL` standard
library and `kwargs` is passed on to that function.
"""
function pick(options::Vector{<:AbstractString}; kwargs...)
    request(MultiSelectMenu(options; kwargs...))
end

function pick(msg::AbstractString, args...; kwargs...)
    @assert !(args[1] isa AbstractString)
    println(msg)
    pick(args...; kwargs...)
end


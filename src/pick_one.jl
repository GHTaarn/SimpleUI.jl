using REPL.TerminalMenus: request, RadioMenu

"""
    pick_one([msg::AbstractString,] options::Vector{<:AbstractString}; default=1, kwargs...)

Interactively display a message `msg` and a menu consisting of `options`
and then return the index of the chosen option. `default` is the index of
the default menu item.

This function uses `Base.REPL.TerminalMenus.RadioMenu` and `kwargs` is
passed on to that function.
"""
function pick_one(options::Vector{<:AbstractString}; default=1, kwargs...)
    request(RadioMenu(options; kwargs...); cursor=default)
end

function pick_one(msg::AbstractString, args...; kwargs...)
    @assert !(args[1] isa AbstractString)
    println(msg)
    pick_one(args...; kwargs...)
end


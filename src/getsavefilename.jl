"""
    getsavefilename(promptstr, defaultfilename::Union{AbstractString,Nothing}=nothing; isallowed=!isempty, exists=ispath)

Prompt the user for a filename and return it.
If the name exists, warn the user and give him/her a chance to input another.
`isallowed` should be a function that returns `true` when the input is an
acceptable return value for this invocation of `getsavefilename`.
`exists` should be a function that returns `true` when the input
represents an existing file or directory.
"""
function getsavefilename(promptstr, defaultfilename::Union{AbstractString,Nothing}=nothing; isallowed=!isempty, exists=ispath)
    retval = nothing
    while isnothing(retval)
        retval = promptget(promptstr, defaultfilename)
        if !isallowed(retval)
            println("\"$retval\" is not allowed")
            retval = nothing
        elseif exists(retval)
            yesno("\"$retval\" exists, overwrite?") && break
            retval = nothing
        else
            break
        end
    end
    retval
end


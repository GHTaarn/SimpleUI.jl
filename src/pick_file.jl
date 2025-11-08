using REPL.TerminalMenus: request, RadioMenu

"""
    pick_file(startdir="."; pattern=r"", kwargs...)

Allow the user to browse through files matching `pattern` in the file system
and return the path of the file selected by the user. If the user presses 'q'
then `nothing` is returned.

This function uses `TerminalMenus.RadioMenu` from the `REPL` standard library
and `kwargs` is passed on to that function.
"""
function pick_file(dir="."; pattern=r"")
    files = [isdir(joinpath(dir,s)) ? s*"/" : s for s in readdir(dir)]
    files = filter(files) do file
        contains(pattern)(file) || contains(r"/$")(file)
    end
    if isdir(joinpath(dir,".."))
        files = vcat("../", files)
    end
    length(files) == 0 && return nothing
    println("\nSelect a file from $dir:")
    isel = request(RadioMenu(files; kwargs...))
    isel <= 0 && return nothing
    fname = files[isel]
    fullpath = joinpath(dir, fname)
    if fullpath[end] == '/'
        pick_file(normpath(fullpath[1:end-1]); pattern, kwargs...)
    else
        fullpath |> normpath
    end
end

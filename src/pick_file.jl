using REPL.TerminalMenus: request, RadioMenu

"""
    pick_file(startdir="."; pattern=r"")

Allow the user to browse through files matching `pattern` in the file system
and return the path of the file selected by the user.
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
    fname = files[request(RadioMenu(files))]
    fullpath = joinpath(dir, fname)
    if fullpath[end] == '/'
        pick_file(normpath(fullpath[1:end-1]); pattern)
    else
        fullpath |> normpath
    end
end

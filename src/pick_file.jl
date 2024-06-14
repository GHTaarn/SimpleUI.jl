using REPL.TerminalMenus: request, RadioMenu

"""
    pick_file(dir="."; pattern=r"", join=true)

Show the files in `dir` that match `pattern` and return the one chosen by the
user. Immediately returns `nothing` if there are no files to choose from.

The `join` keyword works like in the Julia `readdir` function, i.e. if set to
`false` then the raw filename is returned, if set to `true` then `pick_file`
returns`joinpath(dir, fname)` where `fname` is the filename selected by the
user.
"""
function pick_file(dir="."; pattern=r"", join=true)
    files=filter(contains(pattern), readdir(dir))
    length(files) == 0 && return nothing
    fname = files[request(RadioMenu(files))]
    join ? joinpath(dir, fname) : fname
end

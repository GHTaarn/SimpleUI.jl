# TerminalFilePicker.jl
A [Julia](http://julialang.org) package with some very simple functions for
creating text based user interfaces.

## Installation
```julia
import Pkg
Pkg.add(url="https://github.com/GHTaarn/SimpleUI.jl")
```

## Use

At present there are three entrypoints: `pick_file`, `yesno` and `prompt`. All
are described in more detail in their docstrings.

### `pick_file`

The function `pick_file` displays the contents of a directory and waits
for the user to select one of them, e.g.:

```julia
using TerminalFilePicker
pick_file("."; pattern=r"[A-Za-z]*")
```

The return value is the path of whichever file the user selected.

### `yesno`

Other languages have similar functions: prompts the user to answer yes or no
and returns the corresponding `Bool`.

### `prompt`

Prompts the user for some string input with an optional default value.

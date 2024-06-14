# SimpleUI.jl
A [Julia](http://julialang.org) package with some very simple functions for
creating text based user interfaces.

## Installation

Directly from source:
```julia
import Pkg
Pkg.add(url="https://github.com/GHTaarn/SimpleUI.jl")
```

or using [FreeRegistry](https://github.com/GHTaarn/FreeRegistry):
```julia
using Pkg
pkg"registry add https://github.com/GHTaarn/FreeRegistry"
pkg"add SimpleUI"
```

## Use

At present there are five entrypoints: `pick_file`, `pick_one`, `yesno`,
`promptget` and
`pause`. All are described in more detail in their docstrings.

### The `pick_file` function

The function `pick_file` displays the contents of a directory and waits
for the user to select one of them, e.g.:

```julia
using SimpleUI
pick_file("."; pattern=r"[A-Za-z]*")
```

The return value is the path of whichever file the user selected.

### The `pick_one` function

This function displays a menu from which the user must choose one, e.g.:

```julia
using SimpleUI
pick_one("Image quality:",
    ["320x240", "640x480", "1280x960"])
```

### The `yesno` function

Prompts the user to answer yes or no and returns the corresponding `Bool` e.g.:

```julia
using SimpleUI
if yesno("Do you want to quit?")
    exit()
end
```

### The `promptget` function

Prompts the user for some string input with an optional default value e.g.:

```julia
using SimpleUI
write(promptget("Filename to save to", "HelloWorld.txt"), "Hello World!")
```

where `"HelloWorld.txt"` is the default `String` which will be returned by
`promptget` if the user presses the return key without entering any input.

### The `pause` function

Display a message and wait until the user presses the return key, e.g.:

```julia
using Dates, SimpleUI
if Time(now()) > Time(12,0)
    pause("It is too late to use this program")
else
    println("The time is ", now() |> Time)
end
```

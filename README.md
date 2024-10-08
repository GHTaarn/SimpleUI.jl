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

At present there are six entrypoints: `pick_file`, `pick_one`,
`getsavefilename`, `yesno`, `promptget` and `pause`.
All are described below and in more detail in their docstrings.

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
    ["320x240", "640x480", "1280x960"]; default=2)
```

### The `getsavefilename` function

Prompts the user for a filename and checks if the filename is allowed
and if it exists already, e.g.:

```julia
using SimpleUI
getsavefilename("Enter a filename for saving"; isallowed=contains(r".jl$"))
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

Prompts the user for some input with an optional default value e.g.:

```julia
using SimpleUI
sleep(promptget(Float64, "How many seconds do you want to pause?", 5)))
println("Hello ", promptget("Who do you want to say hello to?", "Julia"))
```

where `5` and `"Julia"` are the default values which will be returned by
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

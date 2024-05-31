# SimpleUI.jl
A [Julia](http://julialang.org) package with some very simple functions for
creating text based user interfaces.

## Installation
```julia
import Pkg
Pkg.add(url="https://github.com/GHTaarn/SimpleUI.jl", rev="release-0.1")
```

## Use

At present there are four entrypoints: `pick_file`, `yesno`, `prompt` and
`pause`. All are described in more detail in their docstrings.

### The `pick_file` function

The function `pick_file` displays the contents of a directory and waits
for the user to select one of them, e.g.:

```julia
using SimpleUI
pick_file("."; pattern=r"[A-Za-z]*")
```

The return value is the path of whichever file the user selected.

### The `yesno` function

Prompts the user to answer yes or no and returns the corresponding `Bool` e.g.:

```julia
using SimpleUI
if yesno("Do you want to quit?")
    exit()
end
```

### The `prompt` function

Prompts the user for some string input with an optional default value e.g.:

```julia
using SimpleUI
write(prompt("Filename to save to", "HelloWorld.txt"), "Hello World!")
```

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

## Discussion & feedback

As the technology behind this library is extremely simple, the strength of it
lies in a good interface (API). Ideas and opinions on this are therefore
greatly appreciated and can be submitted either as
[issues](https://github.com/GHTaarn/SimpleUI.jl/issues),
[discussions](https://github.com/GHTaarn/SimpleUI.jl/discussions) or
[pull requests](https://github.com/GHTaarn/SimpleUI.jl/pulls).
Regarding backwards compatibility,
[Julias variant of semver](https://pkgdocs.julialang.org/v1/compatibility/#compat-pre-1.0)
will be obeyed, but otherwise backwards compatibility will have very
low priority until version 1.0. It is therefore

[//]: # (Non-backwards compatible changes are a very real possibility, so it is)

advisable to take this into account in the compat section of the
`Project.toml` file, e.g.:

```julia
import Pkg
Pkg.compat("SimpleUI", "0.1")
```

as this would limit the legal versions to 0.1.x releases and therefore no breaking changes.

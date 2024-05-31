"""
    pause(message::AbstractString=""; instruction="Press return to continue")

Write `message` and `instruction` to `stdout` and return when the user presses
the return key.
"""
function pause(message::AbstractString=""; instruction="Press return to continue")
    !isempty(message) && println(message)
    !isempty(instruction) && println(instruction)
    readline()
end

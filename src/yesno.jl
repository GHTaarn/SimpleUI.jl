"""
    yesno(promptstr::AbstractString, default::Union{Nothing,Bool}=nothing)

Prompt the user to answer 'y' or 'n' to a question and repectively return
`true` or `false`
"""
function yesno(promptstr::AbstractString, default::Union{Nothing,Bool}=nothing)
    @assert default == nothing "Boolean default not yet implemented"
    print("$promptstr (y/n)): ")
    ans = readline()
    if ans in ["y", "Y"]
        return true
    elseif ans in ["n", "N"]
        return false
    else
        println("\nThat was not legal input\nOnly \"y\" and \"n\" are legal inputs\nI will repeat the question\n")
        yesno(promptstr, default)
    end
end

@testset "getsavefilename" begin
    open("data/getsavefilename.txt","r") do stream
        redirect_stdin(stream) do
            @test getsavefilename("Enter filename"; isallowed=contains(".")) == "getsavefilename.jl"
            println()
            @test getsavefilename("Enter filename") == "nonexisting.txt"
            println()
        end
    end
end


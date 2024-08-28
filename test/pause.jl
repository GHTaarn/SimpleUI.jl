@testset "pause" begin
    open("data/pause.txt","r") do stream
        redirect_stdin(stream) do
            @test readline() == "abc"
            pause()
            @test readline() == "def"
        end
    end
end


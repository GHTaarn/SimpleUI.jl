@testset "yesno" begin
    open("data/yesno.txt","r") do stream
        redirect_stdin(stream) do
            @test yesno("Can you answer yes?")
            println()
            @test !yesno("Can you answer no?")
            println()
            @test yesno("Can you answer invalidly?")
            println()
        end
    end
end


@testset "promptget" begin
    using Dates: Date
    open("data/promptget.txt","r") do stream
        redirect_stdin(stream) do
            @test promptget("Give me a String") == "abcሴ"
            println()
            @test promptget(Date, "Give me a Date") == Date(2024, 12, 31)
            println()
            @test promptget("Give me a Float64", 1.0) === 1.0
            println()
            @test promptget("Give me a Float64", NaN) === NaN
            println()
            @test promptget("Give me a Float64", Inf) === Inf
            println()
            @test promptget("Give me a Float64", 1.0) === 2.0
            println()
            @test promptget(Float64, "Give me a Float64", 1000) == 1000.0
            println()
            @test promptget(Float64, "Give me a Float64", pi) === pi
            println()
            @test promptget(Float64, "Give me a Float64", 1) === 2.0
            println()
            @test_throws Exception promptget(Float64, "Give me a Float64")
            println()
        end
    end
end


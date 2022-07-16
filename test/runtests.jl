using Numerical, Test

@testset "test root" begin
  let
    f(x) = x^2 - 2x + 1
    df(x) = 2x - 2
    (status, result) = root(f, df)
    @test status == true
    @test abs(result - 1) < 0.001
  end
end
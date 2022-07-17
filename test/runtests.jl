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

@testset "test interpol" begin
  xs = collect(1:10)
  f(x) = 1 + 2x + 3x^2
  fxs = map(f, xs)

  result = interpolate(xs, fxs, 5)
  @show result
  @show f(5)
end
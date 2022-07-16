function root(f::Function, df::Function; start::Number = 0, n::Int = 100, delta::Number = 0.001)
  satisfied = 0
  i = 2
  xs = Vector{Float64}(undef, n + 1)
  xs[1] = start
  len = length(xs)
  
  while satisfied == 0 && i < len
    xs[i + 1] = xs[i] - f(xs[i]) / df(xs[i])

    if abs(xs[i + 1] - xs[i]) < delta
      satisfied = 1
    end

    i += 1
  end

  if i == 1
    len = 1
  else
    len = i
  end

  if satisfied != 0
    return (true, xs[len])
  else
    return (false, 0)
  end
end
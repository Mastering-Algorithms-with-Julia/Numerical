function lagrangeInterpolate(xs::AbstractVector{T1}, ys::AbstractVector{T2}, target::T3) where {T1 <: Number, T2 <: Number, T3 <: Number}

  C = ones(length(xs))
  predict = 0.0

  for index in 1:length(xs)
    for j in 1:index-1
      C[index] = C[index] * (target - xs[j]) / (xs[index] - xs[j])
    end

    for j in index+1:length(xs)
      C[index] = C[index] * (target - xs[j]) / (xs[index] - xs[j])
    end

    predict = predict + ys[index] * C[index]
  end

  return predict
end

interpolate(xs::Vector{T1}, ys::Vector{T2}, target::T3; method = lagrangeInterpolate) where {T1 <: Number, T2 <: Number, T3 <: Number} =  method(xs, ys, target)


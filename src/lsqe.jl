function lsqe(xs::AbstractVector{T}, ys::AbstractVector{T}) where T <: Number
  n = length(xs)
  sumx = reduce(+, xs)
  sumy = reduce(+, ys)

  sumx2 = reduce(+, map(x -> x ^ 2, xs))
  sumxy = reduce(+, map(*, xs, ys))

  b1 = (sumxy - (sumx * sumy) / n) / (sumx2 - (sumx ^ 2) / n)
  b0 = (sumy - b1 * sumx) / n

  return (b0, b1)
end
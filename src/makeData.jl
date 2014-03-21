require("Distributions")
require("DataFrames")

using Distributions
using DataFrames

function generateData(n::Int64, m::Int64)
  dLower = Uniform(0,1)
  dUpper = Uniform(1,2)
  matrix =  Array(Float64, (n,m))
  y = [  (i <= div(n,2)) ? -1 : 1 for i=1:n ]
  for i = 1:div(n,2), j = 1:m
    setindex!(matrix, rand(dLower), i, j)
  end
  for i = (div(n,2)+ 1):n, j = 1:m
    setindex!(matrix, rand(dUpper), i, j)
  end
  matrix,y
end



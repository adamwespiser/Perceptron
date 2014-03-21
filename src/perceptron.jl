type Perceptron
  X::Array{Float64,2}
  y::Array{Int64,1}
  w::Array{Float64,1}
  iters::Int64
  correct::BitArray{1}
  function Perceptron(Xinput::Array{Float64,2}, y::Array{Int64,1})
    X = [ones(size(Xinput,1)) Xinput]
    (Xrow,Xcol) = size(X)
    yLen = length(y)
    if Xrow != yLen
      error("y and X don't have the same number of rows")
    end
    w = ones(Xcol)
    iters = 10000
    correct = map(sign,X * w) .== y
    new(X,y,w,iters,correct)
  end
end

function updateCorrect(p::Perceptron)
  p.correct = map(sign,p.X * p.w) .== p.y
end

function pickIncorrect(p::Perceptron)
  pFalse = find(p.correct .== false)
  if length(pFalse) == 0
    return -1
  else 
    pFalse[rand(1:length(pFalse))]
  end
end

function updateWeights(p::Perceptron, updateIndex::Int64)
  p.w = p.w + vec(p.y[updateIndex]*transpose(p.X[updateIndex,:]))
end

function convergeAlgorithm(p::Perceptron)
  maxIters = p.iters
  iter = 0
  while(sum(p.correct) < length(p.correct) && iter < maxIters)
    updateCorrect(p)
    fixIndex = pickIncorrect(p)
    if(fixIndex == -1)
      break
    end
    updateWeights(p,fixIndex)
    iter = iter + 1
  end
end






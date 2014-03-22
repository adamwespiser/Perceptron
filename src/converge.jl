include("perceptron.jl")

type moniterConverge
  w::Array{Float64,2}
  iter::Array{Int64,1}
  correct::Array{Int64,1}
  fixIndex::Array{Int64,1}
  maxIters::Int64
  function moniterConverge(maxIters::Int64,wLen::Int64)
    w = Array{Float64,2}
    iter = Array{Int64,1}
    correct = Array{Int64,1}
    fixIndex = Array{Int64,1}
    maxIters = Int64
    new(w,iter,correct,fixIndex,maxIters)
  end
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



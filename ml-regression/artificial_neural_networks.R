

require(nnet)
require(caret)
set.seed(1010)
mygrid = expand.grid(.decay=c(0.5,0.1), .size=c(4,5,6))
nnetfit = train(y/max(w,[,D])~., data=w, method="nnet",
    maxit=1000, tuneGrid=mygrid, trace=F)
print(nnetfit)

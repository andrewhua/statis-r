source("cv.R")

require(nnet)
require(caret)
set.seed(1010)
mygrid = expand.grid(.decay=c(0.5,0.1), .size=c(4,5,6))
nnetfit = train(y/max(w,[,D])~., data=w, method="nnet",
    maxit=1000, tuneGrid=mygrid, trace=F)
print(nnetfit)

MSE = rep(0,Z)
set.seed(1010)
for(i in 1:Z) {
    m = mm[[i]]
    M = mean((w[m,D] - mean(w[m,D]))^2)
    a = nnet(y/max(w[,D])~., data=w[-m,], size=4, decay=0.1)
    MSE[i] = mean((w[m,D] - predict(a, w[m,])*max(w[,D]))^2)/M
}
mean(MSE)

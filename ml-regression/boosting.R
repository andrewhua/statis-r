source("cv.R")

library(mboost)
MSE = rep(0,Z)
set.seed(1010)

for(i in 1:Z){
    m = mm[[i]]
    M = mean((w[m,D] - mean(w[m,D]))^2)
    a = mboost(y~btree(x1)+btree(x2)+btree(x3)+btree(x4)+
                btree(x5)+btree(x6), data=w[-m,])
    MSE[i] = mean((m[m,D] - predict(a,w[m,]))^2)/M
}
mean(MSE)

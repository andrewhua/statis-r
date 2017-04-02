source("cv.R")

library(rpart.plot)
a = rpart(y~., w)
rpart.plot(a, type=2, faclen=T)

MSE = rep(0,Z)
for(i in 1:Z) {
    m = mm[[i]]
    M = mean((w[m,D] - mean(w[m,D]))^2)
    a = rpart(y~., w[-m,])
    MSE[i] = mean((w[m,D] - predict(a, w[m,]))^2)/M
}
mean(MSE)

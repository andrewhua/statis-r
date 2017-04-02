# support vector regression, SVR
source("cv.R")

library(rminer)
set.seed(1010)
MSE = rep(0,Z)
for(i in 1:Z){
    m = mm[[i]]

    a = fit(y~., w[-m,], model="svm")

    M = mean((w[m,D] - mean(w[m,D]))^2)
    MSE[i] = mean((w[m,D] - predict(a, w[m,]))^2)/M
}
mean(MSE)

library(e1071)
set.seed(1010)
MSE = rep(0,Z)
for(i in 1:Z){
    m = mm[[i]]

    a = svm(y~., w[-m,])

    M = mean((w[m,D] - mean(w[m,D]))^2)
    MSE[i] = mean((w[m,D] - predict(a, w[m,]))^2)/M
}
mean(MSE)

library(kernlab)
set.seed(1010)
MSE = rep(0,Z)
for(i in 1:Z){
    m = mm[[i]]

    a = ksvm(y~., w[-m,], model="svm")

    M = mean((w[m,D] - mean(w[m,D]))^2)
    MSE[i] = mean((w[m,D] - predict(a, w[m,]))^2)/M
}
mean(MSE)

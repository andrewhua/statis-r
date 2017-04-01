MSE = rep(0, Z)
for(i in 1:Z){
    m = mm[[i]]
    M = mean((w[m,D] - mean(w[m,D]))^2)
    a = lm(y~., w[-m,])
    MSE[i] = mean((w[m,D] - predict(a, w[m,]))^2)/M
}
mean(MSE)

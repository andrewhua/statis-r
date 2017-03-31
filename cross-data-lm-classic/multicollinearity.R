# 
w = read.csv("data/diabetes.csv")
kappa(w[,12:75])
library(car)
vif(lm(y~., w[, 11:75]))

# ridge regression
w <- read.csv("data/diabetes.csv")
library(ridge)
a <- linearRidge(y~ ., data=w[,11:75])
summary(a)

# lasso regression
library(lars)
x = as.matrix(w[,1:10])
y = as.matrix(w[,11])
x2 = as.matrix(w[,12:75])
laa = lars(x2,y)
plot(laa)
summary(laa)
cva = cv.lars(x2,y,K=10)
best = cva$index[which.min(cva$cv)]
coef = coef.lars(laa, mode="fration", s=best)
min(laa$Cp)
coef1 = coef.lars(laa, mode="step", s=15)

# adaptive lasso; alasso
w = read.csv("data/diabetes.csv")
x = as.matrix(w[,1:10])
y = as.matrix(w[,12:75])
library(msgps)
al = msgps(x2, y, penalty="alasso", gamma=1, lambda=0)
summary(al)
plot(al)

# partial least squares regression, PLSR
library(pls)
ap = plsr(y~x2, 64, validation="CV")
ap$loading
ap$coef 
validationplot(ap)
RMSEP(ap)
MSEP(ap)
R2(ap)

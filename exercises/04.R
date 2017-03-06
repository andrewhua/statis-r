ncol(cars); nrow(cars)
dim(cars)
lm(dist~speed, data=cars)

cars$qspeed <- cut(cars$speed, breaks=quantile(cars$speed), include.lowest=TRUE)
names(cars)
cars[3]
table(cars[3])
is.factor(cars$qspeed)
plot(dist~qspeed, data=cars)
a <- lm(dist~qspeed, data = cars)
summary(a)

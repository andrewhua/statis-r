airquality

complete.cases(airquality)

which(complete.cases(airquality) == F)

sum(complete.cases(airquality))

na.omit(airquality)

x <- 1:10; x[12] <- 3

(x1 <- append(x, 77, after=5))

cbind(1:5, rnorm(5))
rbind(1:5, rnorm(5))
cbind(1:3, 4:6); rbind(1:3, 4:6)

(x <- rbind(1:5, runif(5), runif(5), 1:5, 7:11))

x[!duplicated(x), ]

unique(x)

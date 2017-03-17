x = array(runif(24), c(4,3,2)); x
is.matrix(x)
dim(x)
is.matrix(x[1,,])
x = array(1:24, c(4,3,2))
apply(x,1,mean)
apply(x,1:2,sum)
apply(x,c(1,3),prod)
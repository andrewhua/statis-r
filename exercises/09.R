# x <- scan()
# 1.5, 2.6, 3.7, 2.1, 8.9, 12, -1.2, -4

x <- c(1.5, 2.6, 3.7, 2.1, 8.9, 12, -1.2, -4)

# w = read.table(file.choose(), header=T)
getwd()
setwd("./data")
x = rnorm(20)
write(x, "09-1.txt")
y <- scan("09-1.txt")
y
y <- iris
y[1:5,]
str(y)

write.table(y, "09-2.txt", row.names=F)
w <- read.table("09-2.txt", header=T)
str(w)
write.csv(y, "09-3.csv")
v <- read.csv("09-3.csv")
str(v)

# data=read.table("clipboard")
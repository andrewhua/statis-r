x = rnorm(200)
hist(x, col="light blue")
rug(x)
stem(x)

x <- rnorm(500)
y <- x + rnorm(500)
plot(y~x)

a = lm(y~x)
abline(a, col="red")
print("Hello, world!")
paste("the min of x = ", min(x))
demo(graphics)
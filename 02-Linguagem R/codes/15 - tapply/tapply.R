x <- c(rnorm(10), runif(10), rnorm(10, 1))
x
f <- gl(3, 10)
f
tapply(x, f, mean, simplify = FALSE)
tapply(x, f, range)

split(x, f)
lapply(split(x, f), mean)
tapply(split(x, f), mean)


library(datasets)
head(airquality)
s <- split(airquality, airquality$Month)

x <- rnorm(10)
f1 <- gl(2, 5)
f2 <- gl(5, 2)
f1
f2
x
str(split(x, list(f1, f2)))
str(split(x, list(f1, f2), drop = TRUE))


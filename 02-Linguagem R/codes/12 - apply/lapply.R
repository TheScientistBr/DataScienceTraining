x <- data.frame(ind = 1:12, mes = month.name, 
                valor = rnorm(n = 12, sd = .6, mean = 3),
                total = rnorm(n = 12, sd = 15, mean = 50))
x
lapply(x[3:4],mean)

x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))
x
lapply(x, sum)
sapply(x, sum)



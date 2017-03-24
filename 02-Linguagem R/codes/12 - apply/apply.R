x <- data.frame(ind = 1:12, mes = month.name, 
                valor = rnorm(n = 12, sd = .6, mean = 3),
                total = rnorm(n = 12, sd = 15, mean = 50))
x
apply(x[3:4],1,sum)

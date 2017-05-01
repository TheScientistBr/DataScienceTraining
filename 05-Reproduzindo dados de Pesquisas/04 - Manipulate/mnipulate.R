library(manipulate)
data(mtcars)

myHist <- function(mu){
        hist(mtcars$disp,col="blue",breaks=100)
        lines(c(mu, mu), c(0, 150),col="red",lwd=5)
        mse <- mean((mtcars$disp- mu)^2)
        text(63, 150, paste("mu = ", mu))
        text(63, 140, paste("MSE = ", round(mse, 2)))
}
manipulate(myHist(mu), mu = slider(100, 400, step = 0.5))



manipulate(
        barplot(as.matrix(longley[,factor]), 
                beside = TRUE, main = factor),
        factor = picker("GNP", "Unemployed", "Employed"))

manipulate(
        boxplot(Freq ~ Class, data = Titanic, outline = outline),
        outline = checkbox(FALSE, "Show outliers"))



manipulate(
        plot(cars, xlim = c(0, x.max), type = type, ann = label),
        x.max = slider(10, 25, step=5, initial = 25),
        type = picker("Points" = "p", "Line" = "l", "Step" = "s"),
        label = checkbox(TRUE, "Draw Labels"))


scatterplot <- function(dataset){
        vars <- as.list(names(dataset))
        name <- sys.call()[[2]]
        manipulate(
                plot(dataset[, xaxis] ~ dataset[, yaxis], 
                     xlab = colnames(dataset)[xaxis],
                     ylab = colnames(dataset)[yaxis], 
                     main = as.character(name)),   
                xaxis = slider(1, as.numeric(dim(dataset)[2]), initial = 1), 
                yaxis = slider(1, as.numeric(dim(dataset)[2]), initial = 2)  
        )
}
scatterplot(mtcars)


aPlotFunction <- function(hh, ss, sz){
        zp1 <- qplot(data = cars, x = dist, y = speed,
                     colour = I(hsv(hh/255, 1, 1)),
                     shape = I(ss),
                     size = I(sz))
        print(zp1 + theme_bw())
}

library(ggplot2)
manipulate(
        aPlotFunction(hh, ss, sz),
        hh = slider(0, 255, step = 1, initial = 0),
        ss = slider(1, 255, step = 1, initial = 1),
        sz = slider(1, 20, step = 1, initial = 1))


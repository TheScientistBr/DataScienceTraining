myData <- data.frame(v1 = rnorm(1000), 
                     v2 = rep(c(5,3,4,9,6),20), 
                     v3 = rbinom(1000,size = 20,prob = 0.1))
myData$v4 <- with(myData, v1*v3) 
myData$v5 <- with(myData, v2-v3*rpois(n = 1000,lambda = v2)) 

myData2 <- data.frame(c1 = myData$v2, 
                         c2 = myData$v5,
                         c3 = myData$v1, 
                         c4 = myData$v3, 
                         c5 = myData$v4)
write.csv(x = myData2,file = "myDataSet.csv")

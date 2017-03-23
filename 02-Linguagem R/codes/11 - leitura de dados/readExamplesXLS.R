require("xlsx")
maxLoad <- 10
mydata <- read.xlsx("data/clientes.xlsx", 
                    sheetName  = "Dados",endRow = maxLoad)
head(mydata,3)
mydata <- data.frame(mydata,stringsAsFactors = TRUE)

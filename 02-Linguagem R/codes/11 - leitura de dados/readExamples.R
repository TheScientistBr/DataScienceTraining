doc1  <- read.csv("data/doc1.idx",stringsAsFactors = FALSE, 
                  header = FALSE,
                  col.names = c("term","tfidf"), sep = ";", 
                  encoding = "UTF-8")

doc2  <- read.csv("data/doc2.idx",stringsAsFactors = FALSE, 
                  header = FALSE,
                  col.names = c("term","tfidf"), sep = ";", 
                  encoding = "UTF-8")

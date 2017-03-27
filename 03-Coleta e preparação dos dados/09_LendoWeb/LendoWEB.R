
con = url("http://www.delermando.pro.br")
htmlCode = readLines(con)
close(con)
htmlCode



library(XML)
url <- "http://www.delermando.pro.br"
html <- htmlTreeParse(url, useInternalNodes=T)

xpathSApply(html, "//title", xmlValue)


pg1 = GET("http://httpbin.org/basic-auth/user/passwd")
pg1



pg2 = GET("http://httpbin.org/basic-auth/user/passwd",
    authenticate("user","passwd"))
pg2
names(pg2)

google = handle("http://google.com")
pg1 = GET(handle=google,path="/")
pg2 = GET(handle=google,path="search")
pg1
pg2



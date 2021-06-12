

Trans = data.frame(CHINESE=rep(NA,100),ENGLISH=rep(NA,100))
Trans[1,] = c("uang","ung")
Trans[2,] = c("eng","urn")
Trans[3,] = c("o","awr")
Trans[4,] = c("o","aw")
Trans[5,] = c("o","od")
Trans[6,] = c("ci","ch")
Trans[7,] = c("li","ee")
Trans[8,] = c("lu","loo")



write.csv(Trans , "Chi2Eng.csv",row.names = FALSE)

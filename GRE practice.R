rm(list=ls())
setwd("~/GitHub/GRE-vocab-practice")
vocab=read.csv("vocab1.csv",header=TRUE, stringsAsFactors = FALSE)
# colnames(vocab) = c("word","definition")

vocab$definition=as.character(vocab$definition)
vocab$word=as.character(vocab$word)

l = dim(vocab)[1]
# Change q.range for question that you wanna practice on
q.range=1:20
sample=sample(q.range)

# Create a record that store question that I made mistake on and retest me afterward
mistake={}

count=0
correct=0
# Change no.question to number of questions to be on the quiz
no.question= length(q.range)

  
for (i in sample[1:no.question]){
  count = count + 1
  n <- readline(prompt=paste0(vocab$definition[i],"      "))
  
  
  if (n != vocab$word[i]){
    print(paste0("you are incorect !!! Your score now is    :", correct, "/" ,count,"    The correct answer is: ",vocab$word[i]))
    mistake=c(mistake,i)
  } else {
    correct = correct+1
     print(paste0("Congratulation !!! Your score now is   :", correct, "/",count))
  }
  
  if (n == "break") break

}




# vocab=vocab[-7,]



write.csv(vocab, "vocab1.csv", row.names=FALSE)









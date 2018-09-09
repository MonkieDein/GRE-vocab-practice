rm(list=ls())
setwd("~/GitHub/GRE-vocab-practice")
vocab=read.csv("vocab1.csv")
vocab$Definition=as.character(vocab$Definition)
vocab$ï..Word=as.character(vocab$ï..Word)

l = dim(vocab)[1]
# Change q.range for question that you wanna practice on
q.range=1:10
sample=sample(q.range)

# Create a record that store question that I made mistake on and retest me afterward
mistake={}

count=0
correct=0
# Change no.question to number of questions to be on the quiz
no.question= length(q.range)

  
for (i in sample[1:no.question]){
  count = count + 1
  n <- readline(prompt=paste0(vocab$Definition[i],"      "))
  
  
  if (n != vocab$ï..Word[i]){
    print(paste0("you are incorect !!! Your score now is    :", correct, "/" ,count,"    The correct answer is: ",vocab$ï..Word[i]))
    mistake=c(mistake,i)
  } else {
    correct = correct+1
     print(paste0("Congratulation !!! Your score now is   :", correct, "/",count))
  }
  
  if (n == "break") break

}


















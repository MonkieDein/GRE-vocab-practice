##########################################################################################################################
#                       Set your own Working Directory
##########################################################################################################################
setwd("~/GitHub/GRE-vocab-practice")
rm(list = ls())

#############################################################
#                       LOAD LIBRARY
#############################################################
# Need to go to http://www.omegahat.net/RHTMLForms/ manually download the library
# install.packages("C:/Users/USER/Downloads/RHTMLForms_0.6-0.tar.gz",
#                  repos = NULL, type = "source")
library(RHTMLForms)
library(RCurl)
library(XML)
library(rlist)
library(HelpersMG)
library(installr)
library(rlang)

##########################################################################################################################
vocab=read.csv("vocab1.csv",header=TRUE, stringsAsFactors = FALSE)
colnames(vocab) = c("word","definition")
##########################################################################################################################
# vocab=vocab[-8,]
read=as.data.frame(rep(NA,nrow(vocab)))



for (i in 1:nrow(vocab)){
  if (is.na(read[i,])){
    wget(url = paste0("https://www.dictionary.com/browse/",vocab$word[i]) ,destfile ="word")
    
    webpage <- readLines("word")
    htmlpage <- htmlParse(webpage, asText = TRUE)
    Pronounce <- paste0(str_replace_all(strsplit(xpathSApply(htmlpage, "//div/span [@class='css-1khtv86 e1rg2mtf2']", xmlValue), "[,;]")[[1]][1], "[^[:alnum:]]", ""),"" )
    read[i,] = Pronounce
  }
}

# vocab$read = read[1:1305,]

##########################################################################################################################
##########################################################################################################################

rm(htmlpage)
# pro.split = strsplit(str_replace_all(Pronounce, "[^[:alnum:]]", " ")," " )[[1]][-1]
vocab[grepl('a$', unlist(as.list(read[1:1305,]))),]




##########################################################################################################################
##########################################################################################################################

vocab=read.csv("vocab1.csv",header=TRUE, stringsAsFactors = FALSE)
read = vocab$read

read
which(read=="")


vocab[grepl('oot$', unlist(as.list(read[1:1305]))),]
vocab[grepl('oh$', unlist(as.list(read[1:1305]))),]
vocab[grepl('dl$', unlist(as.list(read[1:1305]))),]

vocab[grepl('y$', unlist(as.list(vocab$word[1:1305]))),]


vocab[grepl('^y', unlist(as.list(read[1:1305]))),]
vocab[grepl('^y', unlist(as.list(vocab$word[1:1305]))),]


vocab[grepl('^verb', unlist(as.list(read[1:1305,]))),]
vocab[grepl('^verb', unlist(as.list(read[1:1305,]))),]
c("noun","adjective","verb")
vocab$read[grepl('^verb', unlist(as.list(read[1:1305,])))] = gsub("verb","",vocab$read[grepl('^verb', unlist(as.list(read[1:1305,])))])









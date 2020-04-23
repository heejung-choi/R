library(wordcloud2)
words <- read.csv(paste0("c:/heejung/Rstudy/data/",filename,".csv"),stringsAsFactors = F)
my_cloud <- wordcloud2(words,size=0.5,col="random-dark")
library(htmltools)
my_path <- renderTags(my_cloud)


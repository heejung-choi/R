gong<- readLines("공구.txt", encoding="UTF-8")
png(filename="wc.png", height=400, width=700, bg="white")
gong2<- extractNoun(gong)
gong2
gong3 <- unlist(gong2)
gong3
result<-gsub("[^가-힣]", "",gong3)
result<-gsub("공구.*", "",result)
result<-gsub("원해.*", "",result)
result<-gsub("해주.*", "",result)
result<-gsub("부탁.*", "",result)
result<-gsub("필요해요", "",result)
resultF <- Filter(function(x) {nchar(x) >= 2}, result)
resultF
gongT <- table(resultF)
gongT 
final <- sort(gongT, decreasing = T)
final
finalHead<-head(final, 50)
words<- as.data.frame(final)

my_graph<-wordcloud(words$resultF, words$Freq, 
          min.freq = 2, 
          random.order = FALSE, 
          colors = palette(), random.color=T)

dev.off()

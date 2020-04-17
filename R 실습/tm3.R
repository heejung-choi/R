#크롤링 시간에 크롤링 해놓은 “yes24.txt” 파일의 내용을 읽고 
#명사만 뽑아내 많이 등장한 단어 순으로 다음과 같이 
#워드클라우딩 하는 R 코드를 작성하여 tm3.R 로 
#그리고 워드 클라우딩 결과는 wc.html 로 저장하여 제출하시오. 
#단, 단어의 길이가 2자~4자로 제한한다.
#result<-wordcloud2(……………………………………)
#library("htmlwidgets") # 없으면 설치
#saveWidget(result,"wc.html",title="WORDCLOUD2 실습", selfcontained = F)
yes<- readLines("yes24.txt")
yes<- extractNoun(yes)
yes2 <- unlist(yes)
result<-gsub("[^가-힣]", "",yes2)
resultF <- Filter(function(x) {nchar(x) >= 2&nchar(x) <= 4}, result)
resultF
gongT <- table(resultF)
gongT 
final <- sort(gongT, decreasing = T)
final
words<- as.data.frame(final)
result<-wordcloud2(data = words)
saveWidget(result,"wc.html",selfcontained = F)

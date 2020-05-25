# 블로그에서 질병 관련 내용 추출하기
library(httr)
library(rvest)
library(XML)
library(httr)
#1) 위염/ 식이지장염/ 위-식도역류병
#2) 대장암/ 췌장암
searchUrl<- "https://openapi.naver.com/v1/search/blog.xml"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"
query <- URLencode(iconv("췌장염좋은음식","euc-kr","UTF-8"))
#검색어 입력 부분
url <- paste0(searchUrl, "?query=", query, "&display=100")
# # display=100 100개를 받아오겠어 라는 의미
doc <- GET(url, add_headers("Content_Type" = "application/xml","X-Naver-client-Id" = Client_ID, "X-naver-Client-Secret" = Client_Secret))
# 블로그 내용에 대한 리스트 만들기 
doc2 <- htmlParse(doc, encoding="UTF-8")
text<- xpathSApply(doc2, "//item/description", xmlValue)




t1<-text #검색어: 대장에좋은음식
t2<-text#대장염에좋은음식
finishT<-append(t1,t2)
t3<-text#대장암에좋은음식
finishT<-append(finishT,t3)
t4<-text#췌장에좋은음식
finishT<-append(finishT,t4)
t5<-text#췌장좋은음식
finishT<-append(finishT,t5)
t6<-text#췌장염좋은음식
finishT<-append(finishT,t6)

#----------------------------문자 뽑아내기
install.packages("Sejong")
install.packages("hash")
install.packages("rJava")
install.packages("tau")
install.packages("RSQLite")
install.packages("devtools")
install.packages("Rcpp")
install.packages("KoNLP")
library(Sejong)
library(KoNLP)
test<- extractNoun(finishT) # 위와 결과는 같은데 이걸로 사용
testU<- unlist(test)
#text3<-strsplit(text2, split= ",")
testU<-gsub("[A-Z][a-z]","",testU)
testU<-gsub("[[:lower:][:upper:][:digit:][:punct:][:cntrl:]]","",testU)
testU<-gsub("*[건강]","",testU)
testU<-gsub("*[식품]","",testU)
testU
testU<- Filter(function(x) {nchar(x) >= 2}, testU)
wordtable <- table(testU)
final2 <- sort(wordtable, decreasing = T)
View(final2)
write.csv(final2,file="opal2.csv")
a<-read.csv(file="opal1.csv")


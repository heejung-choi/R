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
query <- URLencode(iconv("식이지장에좋은음식","euc-kr","UTF-8"))
#검색어 입력 부분
url <- paste0(searchUrl, "?query=", query, "&display=100")
# # display=100 100개를 받아오겠어 라는 의미
doc <- GET(url, add_headers("Content_Type" = "application/xml","X-Naver-client-Id" = Client_ID, "X-naver-Client-Secret" = Client_Secret))
# 블로그 내용에 대한 리스트 만들기 
doc2 <- htmlParse(doc, encoding="UTF-8")
text<- xpathSApply(doc2, "//item/description", xmlValue)


finish<-""

text1<-text #검색어: 위에좋은음식
text2<-text #검색어: 위암에좋은음식
finish<-append(text1,text2)
text3<-text #검색어: 위염좋은음식
finish<-append(finish,text3)
text4<-text #검색어: 식도역류염에좋은음식
finish<-append(finish,text4)
text5<-text #위에좋은 건강식품
finish<-append(finish,text5)
text6<-text #위건강음식
finish<-append(finish,text6)
text7<-text #식이지장에좋은음식
finish<-append(finish,text7)





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
text2<- extractNoun(finish) # 위와 결과는 같은데 이걸로 사용
textU<- unlist(text2)
#text3<-strsplit(text2, split= ",")
textU<-gsub("[A-Z][a-z]","",textU)
textU<-gsub("[[:lower:][:upper:][:digit:][:punct:][:cntrl:]]","",textU)
textU<-gsub("*[건강]","",textU)
textU<-gsub("*[식품]","",textU)
textU
textU <- Filter(function(x) {nchar(x) >= 2}, textU)
word_table <- table(textU)
final <- sort(word_table, decreasing = T)
write.csv(final,file="opal1.csv")
a<-read.csv(file="opal1.csv")
View(a)
View(final)
result<-head(final, 50)
result

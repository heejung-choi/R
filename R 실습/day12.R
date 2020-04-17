install.packages("KoNLP")
# 패키지 설치가 잘 됩니까요?ㅜㅜ
# 2020.04.16 현재 안됩니다요...ㅜㅜ
# 강사컴의 KoNLP.zip을 복사해서 사용합니다.
# KoNLP.zip의 압축을 해제하고 생성된 KoNLP폴더를
#C:\Users\student\Documents\R\win-library\3.6 에
#문서폴더에 없는 경우에는 program files -> R 밑에 넣어라.
# 복사합니다.
# 그리고 나서 다음에 제시된 패키지들을 하나하나
# 설치합니다.
install.packages("Sejong")
install.packages("hash")
install.packages("rJava")
install.packages("tau")
install.packages("RSQLite")
install.packages("devtools")
install.packages("Rcpp")
# KoNLP 로드
library(KoNLP)

# 한번 수행하면 더 이상 수행할 필요가 없어용(오래 걸려)
useSystemDic()
useSejongDic() # 이것만 설치하자.
useNIADic()

word_data <- readLines("book/애국가(가사).txt")
word_data

word_data2 <- sapply(word_data, extractNoun, USE.NAMES = F)
word_data2
word_data3 <- extractNoun(word_data) # 위와 결과는 같은데 이걸로 사용
word_data3

add_words <- c("백두산", "남산", "철갑", "가을", "달")
buildDictionary(user_dic=data.frame(add_words, rep("ncn", length(add_words))), replace_usr_dic=T)

word_data3 <- extractNoun(word_data)
word_data3

undata <- unlist(word_data3)
undata

word_table <- table(undata)
word_table

undata2 <- Filter(function(x) {nchar(x) >= 2}, undata)
word_table2 <- table(undata2)
word_table2

final <- sort(word_table2, decreasing = T)

head(final, 10)

extractNoun("대한민국의 영토는 한반도와 그 부속도서로 한다")
SimplePos22("대한민국의 영토는 한반도와 그 부속도서로 한다")
SimplePos09("대한민국의 영토는 한반도와 그 부속도서로 한다")



# 워드 클라우드


install.packages("wordcloud")#자바에서 다루기 편하다.
library(wordcloud)
install.packages("wordcloud2") #worldcloud2가 좀더 복잡하다. 동적인 특징을 갖고 있다.
library(wordcloud2)

(words <- read.csv("data/wc.csv",stringsAsFactors = F)) #자동으로 팩터가 되는 것을 해제시켰는데, 이것이 캐릭터형 일때만 정상적으로 작동하기 때문이다.
#이미 정렬되어 있다.
head(words)
?windowsFonts #grdevices에서 제공하는 것으로 r 기본 패키지
windowsFonts(lett=windowsFont("휴먼옛체"))
wordcloud(words$keyword, words$freq,family="lett") 
#첫번째 아규먼트:텍스트 백터, 두번째 아규먼트숫자 백터
# 컬러 설정 하지 않았기 때문에 검정색으로 나온다.
#값이 클수록 크게 나오고 값이 작을 수록 작게 나온다.
wordcloud(words$keyword, words$freq) 
#fammily 매개변수를 생략하면 기본적으로 시스템 기본 폰트가 사용되는 결과가 된다.
wordcloud(words$keyword, words$freq, 
          min.freq = 2, 
          random.order = FALSE, 
          rot.per = 0.5, scale = c(4, 1), 
          colors = rainbow(7)) #colors에 rainbow를 사용하고 있기 때문에 컬러풀하게 나온다.

#rot.per: 회전시키는 역할
#min.freq: 최소갯수가 x개 이상인것만 출력하겠다는 뜻
#random.order=FALSE로 하면 가장 큰값을 가운데로 배치시킨다.
#random.order=T로 하면 값이 움직인다.
#scale= 출력되는 폰트의 크기 가장 큰것이 4이고 1씩 줄여 나가겠다.
wordcloud2(words, fontFamily = "휴먼옛체") #wordcloud2는 직접 폰트를 지정해줄 수 있다.
wordcloud2(words,rotateRatio = 1)#100% 회전시켜! : 그러나 랜덤이다.
wordcloud2(words,rotateRatio = 0.5)
wordcloud2(words,rotateRatio = 0) #하나도 회전시키지마!
wordcloud2(words,size=0.5,col="random-dark") #기본크기는 1이다. 사이즈를 줄일 수 있다.
wordcloud2(words,size=0.5,col="random-dark", figPath="book/peace.png") #시스템을 좀 탄다..
wordcloud2(words,size=0.7,col="random-light",backgroundColor = "black")
wordcloud2(data = demoFreq)
wordcloud2(data = words, shape = 'diamond') 
wordcloud2(data = demoFreq, shape = 'star')
wordcloud2(data = demoFreq, shape = 'cardioid')
wordcloud2(data = demoFreq, shape = 'triangle-forward')
wordcloud2(data = demoFreq, shape = 'triangle')
result<-wordcloud2(data = demoFreq, shape = 'pentagon')
library("htmlwidgets")# wordcloud2는 html로 저장해야 되는데 그때 이 라이브러리를 사용해야 한다.
saveWidget(result,"tmpwc.html",selfcontained = F)
#selfcontained = F
head(demoFreq)
str(demoFreq)

# 트위터 글 워드클라우드
library(rtweet) 
appname <- "edu_data_collection"
api_key <- "RvnZeIl8ra88reu8fm23m0bST"
api_secret <- "wTRylK94GK2KmhZUnqXonDaIszwAsS6VPvpSsIo6EX5GQLtzQo"
access_token <- "959614462004117506-dkWyZaO8Bz3ZXh73rspWfc1sQz0EnDU"
access_token_secret <- "rxDWfg7uz1yXMTDwijz0x90yWhDAnmOM15R6IgC8kmtTe"
twitter_token <- create_token(
  app = appname,
  consumer_key = api_key,
  consumer_secret = api_secret,
  access_token = access_token,
  access_secret = access_token_secret)

key <- "취업"
key <- enc2utf8(key)
result <- search_tweets(key, n=100, token = twitter_token)
str(result)
content <- result$retweet_text
content <- gsub("[[:lower:][:upper:][:digit:][:punct:][:cntrl:]]", "", content)   

word <- extractNoun(content)
cdata <- unlist(word)
cdata

cdata <- Filter(function(x) {nchar(x) < 6 & nchar(x) >= 2} ,cdata)
wordcount <- table(cdata) 
wordcount <- head(sort(wordcount, decreasing=T),30)

par(mar=c(1,1,1,1))
wordcloud(names(wordcount),freq=wordcount,scale=c(3,0.5),rot.per=0.35,min.freq=1,
          random.order=F,random.color=T,colors=rainbow(20))


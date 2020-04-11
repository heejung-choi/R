# SNS의 Open API 활용
library(httr)
library(rvest)
library(XML)
library(httr)
rm(list=ls())
#rm -> 이전에 만들었을 수 있기 때문에 해주는 것이 필요
searchUrl<- "https://openapi.naver.com/v1/search/blog.xml"
#URL 문자열 -> 확장자가 xml이면 xml로 응답, json이면 json으로 응답
#요청 헤더에 인증키를 입력해야 하기 때문에 브라우저에서 직접 접속이 안된다.
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"

query <- URLencode(iconv("봄","euc-kr","UTF-8"))# 쿼리문자열 구성하기 위해, URL 인코드 하는 ... 쿼리 문자열 , 영문자 , 일부 특수 문자 빼고는 %와 함께 16진수로 간다.
#봄이라는 문자열을 euc-kr로 인식하여 UTF-8로 바꾸시오
url <- paste0(searchUrl, "?query=", query, "&display=100")
#url : "https://openapi.naver.com/v1/search/blog.xml?query=%EB%B4%84&display=100"
# display=100 100개를 받아오겠어 라는 의미
doc <- GET(url, add_headers("Content_Type" = "application/xml",
                            "X-Naver-client-Id" = Client_ID, "X-naver-Client-Secret" = Client_Secret))
#서버에게 추가로 요청할 처리(추가로 요청할 header)가 있거나, post 방식으로 요청하려면 httr패키지 쓴다. ...add_headers 쿼리문자열 붙이는 ...
# 다 안됨
# 블로그 내용에 대한 리스트 만들기		
doc2 <- htmlParse(doc, encoding="UTF-8")
text<- xpathSApply(doc2, "//item/description", xmlValue)
# xmlValue: 컨텐트를 읽어옴
text
# 검색한 단어는 <b> 볼드 처리가 된다. 
text <- gsub("</?b>", "", text)
# <b> , </b> 모두 없어야 한다. 한번에 없애려면 정규 표현식 ?
# ? -> 바로 앞에 있는 문자가 0번내지 1번 (있거나 없거나)
text <- gsub("&.+t;", "", text) #&lt, &gt
#? : 0번 내지 1번
# + 1번 이상
# * 0번 이상
# . 임의의 문자
# a?b -> ab, b
#xy?z -> xyz, xz
#xy{3}z-> 갯수 지정 가능
#xy+z -> xyz, xyyz, xyyyz, xyyyyz
#xy*Z -> xz, xyz, xyyz, xyyyz, xyyyyz
# x,+z ->x로 시작 Z로 끝내기 중간에 임의 문자 가능
text

# 네이버 뉴스 연동  
searchUrl<- "https://openapi.naver.com/v1/search/news.xml"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"
query <- URLencode(iconv("하남","euc-kr","UTF-8"))
url <- paste0(searchUrl, "?query=", query, "&display=100")
doc <- GET(url, add_headers("Content_Type" = "application/xml",
                            "X-Naver-client-Id" = Client_ID, "X-naver-Client-Secret" = Client_Secret))

# 네이버 뉴스 내용에 대한 리스트 만들기		
doc2 <- htmlParse(doc, encoding="UTF-8")
text<- xpathSApply(doc2, "//item/description", xmlValue); 
text
text <- gsub("</?b>", "", text)

text <- gsub("&.+t;", "", text)
text

# 트위터 글 읽어오기
install.packages("rtweet")
library(rtweet) 
appname <- "edu_data_collection"
api_key <- "RvnZeIl8ra88reu8fm23m0bST"
api_secret <- "wTRylK94GK2KmhZUnqXonDaIszwAsS6VPvpSsIo6EX5GQLtzQo"
access_token <- "959614462004117506-dkWyZaO8Bz3ZXh73rspWfc1sQz0EnDU"    #토큰이란? 서버에 내가 안전한 유저임을 알려 주는 것.  안전한 유저라고 인식되면 서버에서 다양한 정보를 요청 할 수 있다.
access_token_secret <- "rxDWfg7uz1yXMTDwijz0x90yWhDAnmOM15R6IgC8kmtTe"
twitter_token <- create_token( # 변수 사용해서 토큰함수 만들기
  app = appname,
  consumer_key = api_key,
  consumer_secret = api_secret,
  access_token = access_token,
  access_secret = access_token_secret)
# URL로 하는 것이 아니라 ,,, 함수 create_token()로 하는 것이라서 URLencode라는 함수 필요 없음.
key <- "코로나"
key <- enc2utf8(key)# URL 인코딩 함수와 같은 역할
result <- search_tweets(key, n=500, token = twitter_token) #search_tweets(key, n=500, token = twitter_token) 
# key 원하고자 하는 키값을 찾는 것
# n = 키값에 대한 정보를 500개 추출
str(result)  
result$retweet_text   #retweet_text  내용 읽기    
content <- result$retweet_text
content <- gsub("[[:lower:][:upper:][:digit:][:punct:][:cntrl:]]", "", content)   
content

#버스 운행정보... Router 번호 알아야함.
library(XML)
API_key  <- "%2BjzsSyNtwmcqxUsGnflvs3rW2oceFvhHR8AFkM3ao%2Fw50hwHXgGyPVutXw04uAXvrkoWgkoScvvhlH7jgD4%2FRQ%3D%3D"
bus_No <- "402"
url <- paste("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?ServiceKey=", API_key, "&strSrch=", bus_No, sep="")
doc <- xmlParse(url, encoding="UTF-8")
top <- xmlRoot(doc) #경로?
top
df <- xmlToDataFrame(getNodeSet(doc, "//itemList")) #xpath ... //  조상이 누구든 지 간에 itemlist를 찾고... 이 XML 형식을 데이터 프레임으로 바꿔라.
df       #itemList의 서브태그 ( 변수)들을 dataframe 형식으로 만들면 하나의 열을 가진 dataframe 생성됨~
str(df)
View(df)
busRouteId <- df$busRouteId
busRouteId

url <- paste("http://ws.bus.go.kr/api/rest/buspos/getBusPosByRtid?ServiceKey=", API_key, "&busRouteId=", busRouteId, sep="")
doc <- xmlParse(url, encoding="UTF-8") 
top <- xmlRoot(doc)
top
df <- xmlToDataFrame(getNodeSet(doc, "//itemList")) # itmelist가 여러개,.. 이 여러개의 돔객체를 받아와서 dataframe으로 바꿈 .
df
View(df)

# 서울시 빅데이터- XML 응답 처리
# http://openapi.seoul.go.kr:8088/796143536a756e69313134667752417a/xml/LampScpgmtb/1/100/
#http://openapi.seoul.go.kr:8088/(인증키)/xml/CardSubwayStatsNew/1/5/20151101  샘플 OpenAPI URL 
library(XML)
key = '796143536a756e69313134667752417a'
contentType = 'xml'
startIndex = '1'
endIndex = '200'
url = paste0('http://openapi.seoul.go.kr:8088/',key,'/',contentType,'/LampScpgmtb/',startIndex,'/',endIndex,'/')

con <- url(url, "rb") 
imsi <- read_html(con)
t <- htmlParse(imsi, encoding="UTF-8")
upNm<- xpathSApply(t,"//row/up_nm", xmlValue) 
pgmNm<- xpathSApply(t,"//row/pgm_nm", xmlValue)
targetNm<- xpathSApply(t,"//row/target_nm", xmlValue)
price<- xpathSApply(t,"//row/u_price", xmlValue)

df <- data.frame(upNm, pgmNm, targetNm, price)
View(df)
write.csv(df, "edu.csv")

# 한국은행 결제 통계시스템 Open API - JSON 응답 처리
library(jsonlite)
# 따로 설치 안해도 로드가 된다.
key = '/4WQ7X833TXC370SUTDX4/'
contentType = 'json/'
startIndex = '1'
endIndex = '/100/'
# http://ecos.bok.or.kr/api/KeyStatisticList/4WQ7X833TXC370SUTDX4/json/kr/1/100/
url <- paste0('http://ecos.bok.or.kr/api/KeyStatisticList',key,contentType,'kr/',startIndex,endIndex)
response <- GET(url)
# 이미지 크롤링 할때도 쓰였다 -> content -> httr
json_data <- content(response, type = 'text', encoding = "UTF-8")
# json 응답으로 출력되고 있는 것을 볼 수 있다. 
#바이너리가 아니므로 타입 text
json_obj <- fromJSON(json_data)
#fromJSON -> json으로부터 객체를 만드는 것
#오류가 난다면 json에 문제가 있는 것이다.
#toJSON 데이터 프레임을 json형식으로 변환해 주는 것
df <- data.frame(json_obj)
df <- df[-1]
names(df) <- c("className", "unitName", "cycle", "keystatName", "dataValue")
View(df)


# apply 계열의 함수를 알아보자
weight <- c(65.4, 55, 380, 72.2, 51, NA)
height <- c(170, 155, NA, 173, 161, 166)
gender <- c("M", "F","M","M","F","F")

df <- data.frame(w=weight, h=height)
df
# na.rm=TRUE 결측값 포함 안하게
apply(df, 1, sum, na.rm=TRUE) #행단위로 합
apply(df, 2, sum, na.rm=TRUE) #열단위로 합
lapply(df, sum, na.rm=TRUE) 
#기본은 열단위로 일을 한다. 여기서 l은 list로 받겠다는 것이다.
sapply(df, sum, na.rm=TRUE)
# 백터로 가능하다면 백터로 안된다면 매트릭스로
tapply(1:6, gender, sum, na.rm=TRUE)
#1:6을 gender라는 값을 기준으로 하여 그룹을 나눠라 (M/F)로 그룹 나눔
tapply(df$w, gender, mean, na.rm=TRUE)
#df가 가지고 있는 w의 순서와 gender가 같아야 한다.
mapply(paste, 1:5, LETTERS[1:5], month.abb[1:5])
#mutifly -> 다른것은 함수가 두번째 또는 세번째에 오지만 이것은 함수가 첫번째에 온다.
#가변형 이기 때문에 뒤에 변수를 많이 가져오기 위해서 이다.

#함수를 만들어서 전달
v<-c("abc", "DEF", "TwT")
#function을 한줄로 할 경우에는 대괄호가 없어도 된다. 
#마지막에 있는 값이 추출되는 경우에는 return 함수를 쓰지 않아도 된다.
sapply(v, function(d) paste("-",d,"-", sep=""))

l<-list("abc", "DEF", "TwT")
#백터로 리턴하는 결과/ sapply같은 경우에는 그때그때 다르다.
sapply(l, function(d) paste("-",d,"-", sep=""))
#리스트로 리턴
lapply(l, function(d) paste("-",d,"-", sep=""))

flower <- c("rose", "iris", "sunflower", "anemone", "tulip")
#백터에 들어있는 전체 갯수
length(flower)
#문자 길이
nchar(flower)
#문자 길이가 5개 이상인 것만 리턴한다. -> list로 리턴했다.
#데이터셋이 없다라는 것은 NULL
sapply(flower, function(d) if(nchar(d) > 5) return(d))
sapply(flower, function(d) if(nchar(d) > 5) d)#위와 같은 결과가 나온다. 
sapply(flower, function(d) if(nchar(d) > 5) return(d) else return(NA)) #NULL값을 NA로 주고 싶다면
sapply(flower, function(d) paste("-",d,"-", sep=""))
sapply(flower, function(d, n) if(nchar(d) > n) return(d), 4)
sapply(flower, function(d, n=5) if(nchar(d) > n) return(d))

r<-NULL
count <- 1
myf <- function(x, wt=T){
  print(paste(x,"(",count,")"))
  Sys.sleep(3)
  if(wt) 
    r <- paste("*", x, "*")
  else
    r <- paste("#", x, "#")
  count <<- count + 1;
  print(r)
  return(r)
}

result <- sapply(df$w, myf)
length(result)
result
sapply(df$w, myf, F)
sapply(df$w, myf, wt=F)
rr1 <- sapply(df$w, myf, wt=F)
str(rr1)
print(r)

count <- 1
sapply(df, myf)#데이터 프레임일때는 하나의 열만큼 보낸다.
rr2 <- sapply(df, myf)
str(rr2)
rr2[1,1]
rr2[1,"w"]
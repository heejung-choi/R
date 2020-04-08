#[ OPEN API 실습 1 ] 
#네이버의 블로그에서 “맛집” 이라는 단어가 들어간 글들을 검색하여 100개까지 추출한 다음 naverblog.txt 파일로 저장하시오.
#단, XML 형식의 요청을 처리한다.
#제거해야 하는 문자들 : <b>, </b>, &quot;, &gt;

searchUrl<- "https://openapi.naver.com/v1/search/blog.xml"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"
query <- URLencode(iconv("맛집","euc-kr","UTF-8"))
url <- paste0(searchUrl, "?query=", query, "&display=100")
doc <- GET(url, add_headers("Content_Type" = "application/xml",
                            "X-Naver-client-Id" = Client_ID, "X-naver-Client-Secret" = Client_Secret))
doc2 <- htmlParse(doc, encoding="UTF-8")
text<- xpathSApply(doc2, "//item/description", xmlValue)
text
text <- gsub("</?b>", "", text)
text <- gsub("&.+t;", "", text)
text
write(text,"naverblog.txt")

#[ OPEN API 실습 2 ] 
#트위터에서  “취업” 이라는 단어가 들어간 트윗 글들을 검색하여 100개까지 추출한 다음 twitter.txt 파일로 저장하시오.
#제거해야 하는 문자들과 데이터 값 : \u 로 시작하는 숫자들, \U 로 시작하는 숫자들, NA 값
# 트위터 글 읽어오기
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
key <- "취업"
key <- enc2utf8(key)# URL 인코딩 함수와 같은 역할
result <- search_tweets(key, n=100, token = twitter_token)
str(result)  
result$retweet_text    
content <-result$retweet_text
content<-na.omit(content) #na 제거
content <- gsub("[단독]", "", content)#[단독] 제거
content <- gsub("[[:punct:]]", "", content)#특수문자 제거
content <- gsub("\n", "", content)#개행문자 제거
content <- gsub("[a-z]", "", content)#영어 제거
content <- gsub("[A-Z]", "", content)#영어 제거
content
write(content,"twitter.txt")

#[ OPEN API 실습 3 ] 화면에 나가는 것
#공공DB에서 360번 차량에 대하여 정보를 추출한 다음 
#노선ID, 노선길이, 기점, 종점, 배차간격을 다음 형식으로 출력하시오.
#노선 ID: busRouteId
#노선 길이: length
#기점: stStationNm
#종점: edStationNm
#배차간격: term
library(XML)
API_key  <- "%2BjzsSyNtwmcqxUsGnflvs3rW2oceFvhHR8AFkM3ao%2Fw50hwHXgGyPVutXw04uAXvrkoWgkoScvvhlH7jgD4%2FRQ%3D%3D"
bus_No <- "360"
url <- paste("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?ServiceKey=", API_key, "&strSrch=", bus_No, sep="")
doc <- xmlParse(url, encoding="UTF-8")
top <- xmlRoot(doc) #경로?
top
df <- xmlToDataFrame(getNodeSet(doc, "//itemList")) #xpath ... //  조상이 누구든 지 간에 itemlist를 찾고... 이 XML 형식을 데이터 프레임으로 바꿔라.
View(df)
df       #itemList의 서브태그 ( 변수)들을 dataframe 형식으로 만들면 하나의 열을 가진 dataframe 생성됨~
#360번 버스정보만 추출
busRouteId <- df$busRouteId[1]
length<-df$length[1]
stStationNm<-df$stStationNm[1]
edStationNm<-df$edStationNm[1]
term<-df$term[1]
#앞에 ID값 더해줌
bustitle<-"[360번 버스정보]"
busRouteId<-paste("노선 ID:",busRouteId)
length<-paste("노선길이:",length)
stStationNm<-paste("기점:",stStationNm)
edStationNm<-paste("종점:",edStationNm)
term<-paste("배차간격:",term)
#출력
cat(bustitle,busRouteId,length,stStationNm,edStationNm,term,sep="\n")
#[ OPEN API 실습 4 ]
#네이버의 뉴스에서 “빅데이터” 라는 단어가 들어간 뉴스글들을 검색하여 100개까지 추출한 다음 
#뉴스 제목을 추출하여 navernews.txt 파일로 저장하시오.
#단, JSON 형식의 요청을 처리한다.
#제거해야 하는 문자들 : <b>, </b>, &quot;, &gt;

# 네이버 뉴스 연동  
searchUrl<- "https://openapi.naver.com/v1/search/news.json"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"
query <- URLencode(iconv("빅데이터","euc-kr","UTF-8"))
url <- paste0(searchUrl, "?query=", query, "&display=100")
doc <- GET(url, add_headers("Content_Type" = "application/json",
                            "X-Naver-client-Id" = Client_ID, "X-naver-Client-Secret" = Client_Secret))
json_data <- content(doc, type = 'text', encoding = "UTF-8")
json_obj <- fromJSON(json_data)
View(json_obj)
news<-json_obj[["items"]][["title"]] #뉴스 내용만 추출
news<- gsub("</?b>", "", news)
news <- gsub("&.{,3}t;", "",news)
news
write(news,"navernews.txt")

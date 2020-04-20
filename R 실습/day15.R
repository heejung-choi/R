rm(list=ls())
# leaflet과 우리나라 행정구역 지도 활용
#install.packages("Rtools")
#install.packages("devtools") 
#install.packages("Rcpp") 
#install.packages("tmap")
# devtools::install_github("cardiomoon/Kormaps") 
#:오류, 패키지 복사하기
library(Kormaps)
library(dplyr)
library(leaflet)
install.packages("rgeos") 
library(rgeos)
Sys.setlocale("LC_ALL","English") #입출력을 영어로 하겠다.

str(korpopmap1) # korpopmap1: 2010년 행정구역지도 level1(시/도별) + 인구총조사(2010)
str(korpopmap2) # korpopmap2: 2010년 행정구역지도 level2(시/군/구) + 인구총조사(2010)
str(korpopmap3) # korpopmap3: 2010년 행정구역지도 level3(읍/면/동) + 인구총조사(2010)

View(korpopmap1)
View(korpopmap2)
View(korpopmap3)

names(korpopmap1)
names(korpopmap2)
names(korpopmap3)

Encoding(names(korpopmap1))
Encoding(names(korpopmap2))
Encoding(names(korpopmap3))

Encoding(names(korpopmap1)) <- 'UTF-8' #인코딩정보를 UTF-8로 설정함으로 한글깨지는 문제가 해결
Encoding(names(korpopmap2)) <- 'UTF-8'
Encoding(names(korpopmap3)) <- 'UTF-8'

korpopmap2@data$name
Encoding(korpopmap2@data$name)
Encoding(korpopmap2@data$name)<-'UTF-8'
Encoding(korpopmap2@data$행정구역별_읍면동)<-'UTF-8'
seoulpopmap@data$행정구역별_읍면동
seoulpopmap <- korpopmap2
seoulpopmap@data <- seoulpopmap@data[-26:-251,] # 서울 지역의 구만
seoulpopmap@polygons<-seoulpopmap@polygons[-26:-251] # 서울 지역의 구만
seoulpopmap

crime <- read.csv('data/2017crime.csv')
head(crime)

palette1<-colorNumeric(palette = 'Oranges', domain = crime$살인_발생) #살인발생한 곳에 컬러를 추출
popup1 <- paste0(seoulpopmap$name,'<br> 살인 : ',crime$살인_발생, '건')
map4<-leaflet(seoulpopmap) %>%  setView(lat=37.559957 ,lng=126.975302 , zoom=11)%>% addTiles() %>%
  addPolygons(stroke=FALSE,smoothFactor=0.2,fillOpacity=.5, popup=popup1, color=~palette1(crime$살인_발생), group='살인')
map4

# stroke=T라고 하면 촌스럽게 나온다.  #smoothFactor: 큰차이 없다.
#popup :클릭할때 뭘 출력하게 할건지.

palette2<-colorNumeric(palette = 'Blues', domain = crime$폭력_발생)
popup2 <- paste0(seoulpopmap$name,'<br> 폭력 : ',crime$폭력_발생, '건')
map5<-leaflet(seoulpopmap) %>% addTiles() %>% setView(lat=37.559957 ,lng=126.975302 , zoom=11)%>%
  addPolygons(stroke=FALSE,smoothFactor=0.2,fillOpacity=.5, popup=popup2, color=~palette2(crime$폭력_발생), group='폭력')
map5


palette3<-colorNumeric(palette = 'Reds', domain = crime$범죄_발생_총합)
popup3 <- paste0(seoulpopmap$name,'<br> 범죄_발생_총합 : ',crime$범죄_발생_총합, '건')
map6<-leaflet(seoulpopmap) %>% addTiles() %>% setView(lat=37.559957 ,lng=126.975302 , zoom=11)%>%
  addPolygons(stroke=FALSE,smoothFactor=0.2,fillOpacity=.5, popup=popup3, color=~palette3(crime$범죄_발생_총합),group='총 범죄')

map6

palette2<-colorNumeric(palette = 'Blues', domain = crime$폭력_발생)
popup2 <- paste0(seoulpopmap$name,'<br> 폭력 : ',crime$폭력_발생, '건')
map8<-leaflet(seoulpopmap) %>% addTiles() %>% setView(lat=37.559957 ,lng=126.975302 , zoom=11)%>%
  addPolygons(stroke=FALSE,smoothFactor=0.2,fillOpacity=.5, popup=popup2, color=~palette2(crime$폭력_발생), group='폭력') %>%
  addPolygons(stroke=FALSE,smoothFactor=0.2,fillOpacity=.5, popup=popup3, color=~palette3(crime$범죄_발생_총합),group='총 범죄')
map8

clearGroup(map8, '폭력')

rm(list=ls())
#library(Kormaps)
DONG<-read.csv('data/one.csv')
Encoding(names(korpopmap2))<-'UTF-8'
Encoding(korpopmap2@data$name)<-'UTF-8'
Encoding(korpopmap2@data$행정구역별_읍면동)<-'UTF-8'

Encoding(names(korpopmap3))<-'UTF-8'
Encoding(korpopmap3@data$name)<-'UTF-8'
Encoding(korpopmap3@data$행정구역별_읍면동)<-'UTF-8'
head(korpopmap3@data)

View(korpopmap2)
View(korpopmap3)

k2 <- korpopmap2
k3 <- korpopmap3
k2@data[c("C행정구역별_읍면동", "행정구역별_읍면동")]
k3@data[c("C행정구역별_읍면동", "행정구역별_읍면동")] 
#c가 붙어있는 컬럼은 지역의 코드번호이다.
View(k2@data)
# 양천구의 구코드 출력
k2@data[k2@data$C행정구역별_읍면동 == '11150', 
        c("C행정구역별_읍면동", "행정구역별_읍면동")]
# 양천구에 속한 동의 코드 출력 --> 추출되지 않음 코드가 
#11150으로 시작하는 코드로 상세히 구성되있기 때문에.
k3@data[k3@data$C행정구역별_읍면동 == '11150', 
        c("C행정구역별_읍면동", "행정구역별_읍면동")]

View(k3@data)
# 양천구에 속한 동의 코드 출력 --> 추출됨
# grep ->11150으로 시작하는 인덱스를 사용 (해당하는 행번호 추출해주는 함수)
k3@data[grep('^11150', k3@data$C행정구역별_읍면동), 
        c("C행정구역별_읍면동", "행정구역별_읍면동")]


# 강남구의 동 뽑기 
guname <- '강남구' #여기서 값만 바꾸면 다른 구의 동도 뽑아낼 수 있다.
gucode <- k2@data[k2@data$name == guname, "code.data"]
pattern <- paste0('^', gucode)
k3@data[grep(pattern, k3@data$code.data), 
        c("code.data", "name")]

# 강남구 1인 가구 뽑기
k3@data$name<-gsub('·','',k3@data$name) 
colnames(DONG)<-c('구별','name','일인가구')
dong <- DONG %>%filter(구별=='강남구')


# 광진구 데이터만 뽑음
k3@data<-k3@data[c(67:81),]  #이렇게 하지 않으면 k3@data에 너무 많이 들어가있다.
k3@polygons<-k3@polygons[c(67:81)] 
View(k3@polygons)

k3@data$name<-gsub('·','',k3@data$name) 
colnames(DONG)<-c('구별','name','일인가구')
dong <- DONG %>%filter(구별=='광진구')

k3@data<-merge(k3@data,dong,by.x='name',sort=FALSE)
mymap <- k3@data
#mypalette <- colorNumeric(palette ='RdYlBu' , domain = k3@data$'일인가구')
#mypalette <- colorNumeric(palette ='PuRd' , domain = k3@data$'일인가구')
mypalette <- colorNumeric(palette ='Set3' , domain = k3@data$'일인가구')
mypopup <- paste0(mymap$name,'<br> 1인가구: ',k3@data$'일인가구')

map7 <- NULL #이전에 담겨져 있는 것이 있다면 해제시키는 것
map7<-leaflet(k3) %>% 
  addTiles() %>% 
  setView(lat=37.52711, lng=126.987517, zoom=12) %>%
  addPolygons(stroke =FALSE,
              fillOpacity = .7,
              popup = mypopup,
              color = ~mypalette(k3@data$일인가구)) %>% 
  addLegend( values = ~k3@data$일인가구,
             pal = mypalette ,
             title = '인구수',
             opacity = 1)
map7		

#   addLegend: 검례


#install.packages("RColorBrewer")
library(RColorBrewer) #여러개의 팔레트 

for(col_i in c('YlGn','RdPu', 'PuRd', 'BrBG', 'RdBu', 'RdYlBu', 'Set3', 'Set1')){
  print(col_i)
  print(brewer.pal(n = 5, name = col_i))
}

install.packages("htmlwidgets")
library(htmlwidgets)
saveWidget(map7, file="m.html")



library(leaflet)
View(quakes)
str(quakes)
data <- quakes[1:20,]
#data <- quakes
library(dplyr)
leaflet() %>% addTiles() %>%
  addMarkers(data$long, data$lat, popup = paste("지진 강도 : ",
                                                as.character(data$mag)), label = as.character(data$mag))


data = quakes[1:20,]
leaflet() %>% addTiles() %>%
  addMarkers(data$long, data$lat, popup = paste("지진 강도 : ",
                                                as.character(data$mag)), label = as.character(data$mag))


getColor <- function(quakes) {
  result <- sapply(quakes$mag, function(mag) {
    if(mag <= 4) {
      "green"
    } else if(mag <= 5) {
      "orange"
    } else {
      "red"
    } })
  return(result)
}

icons <- awesomeIcons(
  icon = 'ios-close',
  iconColor = 'black',
  library = 'ion',
  markerColor = getColor(data)
)

leaflet() %>% addTiles() %>%
  addAwesomeMarkers(data$long, data$lat, icon=icons, 
                    label = as.character(data$mag))

?addAwesomeMarkers

# R과 Oacle 연동
install.packages("DBI");
install.packages("RJDBC");
library(RJDBC)
library(DBI)

drv <- JDBC("oracle.jdbc.driver.OracleDriver","C:/heejung/ojdbc6.jar")
conn <- dbConnect(drv,"jdbc:oracle:thin:@localhost:1521:xe","jdbctest","jdbctest")
conn
# dbListTables(conn): 만들어져 있는 테이블 출력 , 딕셔너리도 같이 출력한다.
result1<-dbReadTable(conn,"VISITOR") # DB에서 table정보 dataframe으로 가져오기 
result1<-dbReadTable(conn,"visitor") #테이블명 대문자 소문자 상관 없음
result1
class(result1)
mode(result1)
result2 <- dbGetQuery(conn, "SELECT * FROM VISITOR")
result2
class(result2)
result3 <- dbSendQuery(conn, "SELECT * FROM VISITOR")                                       
result3
class(result3)
ret1 <- dbFetch(result3, 1)
#jbdc result set 객체이다. 하나하나 가지고 와야 한다.
#Fetch를 해줘서 데이터 프레임으로 환산해준다.
#Fetch해서 가져가게 되면 기존에 있던것을 없애면서 가져간다.
#첫번째 행부터 읽어오고 싶으면 다시 읽어와야 한다.
ret1
ret2 <- dbFetch(result3, 2)
ret2

dbGetQuery(conn, "SELECT * FROM TAB")
# 테이블에 데이터 저장하기
# 방법 1
dbWriteTable(conn,"book1",data.frame(bookname=c("자바의 정석","하둡 완벽 입문","이것이 리눅스다"),
                                     price=c(30000,25000,32000)))
dbGetQuery(conn, "SELECT * FROM book1")
dbWriteTable(conn,"cars",head(cars,3))
dbGetQuery(conn, "SELECT * FROM cars")
# 방법 2
dbSendUpdate(conn,"INSERT INTO VISITOR VALUES('R언어',sysdate,'R 언어로 데이터를 입력해요')")
dbSendUpdate(conn,"INSERT INTO VISITOR VALUES('하둡',sysdate,'대용량 데이터 분산저장& 처리기술')")
dbSendUpdate(conn,"INSERT INTO NEWS VALUES(news_seq.nextval, '유니코','테스트', 'R로 데이터를 입력하는거 테스트입니당..', sysdate, 0)")

# 데이터 수정
dbSendUpdate(conn,"INSERT INTO cars(speed, dist) VALUES(1,1)") #컬럼 2개 테이블 
dbSendUpdate(conn,"INSERT INTO cars(speed, dist) VALUES(2,2)")
dbReadTable(conn,"CARS")
dbSendUpdate(conn,"UPDATE CARS SET DIST =DIST*100 WHERE SPEED =1")
dbReadTable(conn,"CARS")
dbSendUpdate(conn,"UPDATE CARS SET DIST =DIST*3 WHERE SPEED =1")
dbReadTable(conn,"CARS")

# 테이블 삭제
dbRemoveTable(conn,"CARS")

#######################다양한 DB 연동 예제들##################################
# 예제 1
df <- read.table("data/product_click.log",stringsAsFactors = F)
head(df)
str(df)
names(df) <-c("click_time","pid")
df$click_time <- as.character(df$click_time)
dbWriteTable(conn,"productlog",df)
result4 <-dbReadTable(conn,"PRODUCTLOG")
result4
# 예제 2
dbWriteTable(conn,"mtcars",mtcars)
rs <- dbSendQuery(conn,"SELECT*FROM mtcars WHERE cyl=4")
rs
dbFetch(rs)
dbClearResult(rs)

rs <- dbSendQuery(conn,"SELECT*FROM mtcars")
ret1<- dbFetch(rs,10)
ret2<- dbFetch(rs)
dbClearResult(rs)

nrow(ret1)
nrow(ret2)

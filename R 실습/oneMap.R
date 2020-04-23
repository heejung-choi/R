rm(list = ls())
library(dplyr);library(leaflet);library(Kormaps)
DONG<-read.csv('data/one.csv')
Encoding(names(korpopmap2))<-'UTF-8'
Encoding(korpopmap2@data$name)<-'UTF-8'
Encoding(korpopmap2@data$행정구역별_읍면동)<-'UTF-8'
Encoding(names(korpopmap3))<-'UTF-8'
Encoding(korpopmap3@data$name)<-'UTF-8'
Encoding(korpopmap3@data$행정구역별_읍면동)<-'UTF-8'
head(korpopmap3@data)
k2 <- korpopmap2
k3 <- korpopmap3

#강남구 데이터 뽑기
guname <- '강동구'
gucode <- k2@data[k2@data$name == guname, "code.data"]
# 강남구: 11230
pattern <- paste0('^', gucode)
grepD<-grep(pattern,k3@data$code.data)
k3@data<-k3@data[grepD,]
k3@polygons<-k3@polygons[grepD]
View(k3@polygons)

#강남구 데이터 저장
k3@data$name<-gsub('·','',k3@data$name)
colnames(DONG)<-c('구별','name','일인가구')
dong <- DONG %>%filter(구별=='강동구')
k3@data<-merge(k3@data,dong,by.x='name',sort=FALSE)
mymap <- k3@data

mypalette <- colorNumeric(palette ='Set3' , domain = k3@data$'일인가구')
mypopup <- paste0(mymap$name,'<br> 1인가구: ',k3@data$'일인가구')


#지도 출력
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

#html 저장
library(htmlwidgets)
saveWidget(map7, file="oneMap.html")
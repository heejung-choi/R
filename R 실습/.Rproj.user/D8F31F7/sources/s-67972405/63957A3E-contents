# 테이블을 읽어오자
# 정적페이지
library(XML)
library(rvest)
url = "https://en.wikipedia.org/wiki/List_of_countries_and_dependencies_by_population"
read1 <- read_html(url)
read2 <- htmlParse(read1) #parsing해서 돔객체 저장
first_table <- getNodeSet(read2,"//table")[[1]] #xpath 사용 table위치에 id가 있으면 id를 가져와도 됨!
xt <- readHTMLTable(first_table,header = T)
#렌더링 될 때 thead가 작성된 것 뿐, 실제로 사용된 것이 아님
#만들어진 태그들에 의존적이다
xt


# http://www.airkorea.or.kr/ : 한국환경공단 실시간 자료 조회
# 동적페이지
rm(list=ls())
library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open()
url <- "http://www.airkorea.or.kr/web/pmRelay?itemCode=11008&pMENU_NO=109"
remDr$navigate(url)

webElem <- remDr$findElement(using = "css", "#dateDiv_1 > img")
webElem$clickElement()
#달력버튼 선택
Sys.sleep(1)
webElem <- remDr$findElement(using = "css", "#ui-datepicker-div > table > tbody > tr:nth-child(2) > td:nth-child(7) > a")
webElem$clickElement()
#날짜버튼 선택
Sys.sleep(1)
webElem <- remDr$findElement(using = "css", "#cont_body > form > div > div > a:nth-child(1)")
webElem$clickElement()
#검색버튼 선택
Sys.sleep(3)

library(XML)
elem <- remDr$findElement(using="css", value=".st_1")
elemtxt <- elem$getElementAttribute("outerHTML")
elem_html <- htmlTreeParse(elemtxt, asText = TRUE, useInternalNodes = T, encoding="UTF-8") #여기서 encoding해서 깨지는 것은 당연함
Sys.setlocale("LC_ALL", "English") #Sys.setlocale 해서 readHTMLTable하는 동안에만 영어환경으로 다 바꿔줌
games_table <- readHTMLTable(elem_html, header = T, stringsAsFactors = FALSE)[[1]]
# readHTMLTable은 list로 return해줌. -> 첫번째 리스트만 가지고 와야 함
Sys.setlocale() #그 후에 다시 한글 환경으로 바꿔줘야 content가 깨지지 않음 ->그래도 제목은 깨짐..^_^ #이거 없으면 글씨 다 깨짐! (=encoding 기능) 인코딩과 같음
Encoding(names(games_table)) <- "UTF-8" #제목과 content에 적용해주는게 달라서 다시 적용해줘야 함
head(games_table)
str(games_table)
View(games_table)
tail(games_table)
str(elem_html)
Sys.getlocale() #MS949 내보내줌

# ggplot2 패키지를 활용한 고급시각화

install.packages("ggplot2") # ggplot2 패키지 설치
install.packages("glue") # ggplot2 로드시 이 패키지 오류나면 
library(ggplot2)
library(dplyr)

mpg <- as.data.frame(ggplot2::mpg)
str(mpg)
ggplot(mpg) + geom_point(aes(displ, hwy))#x 축 배기량 y축 고속도로 연비
ggplot(mpg, aes(displ, hwy)) + geom_point()
# x축 displ, y축 hwy로 지정해 배경 생성
ggplot(data = mpg, aes(x = displ, y = hwy))
# 배경에 산점도 추가
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point() + coord_cartesian(xlim=c(3, 6)) 
#coord_cartesian 함수를 통해 x축과 y축의 넓이를 지정해줄 수 있다.
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point() + coord_cartesian(xlim=c(3, 6), ylim=c(10, 30))
ggplot(data = mpg, aes(x = displ, y = hwy, col = drv)) + geom_point()
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point(aes(color=drv))#여기에 colour=drv 이라고 되어있는 경우도 있는데 이것도 지원된다.

data(airquality)
str(airquality)
View(airquality)
ggplot(airquality, aes(x=Day, y=Temp))
ggplot(airquality, aes(x=Day, y=Temp)) + geom_point()
ggplot(airquality, aes(x=Day, y=Temp)) + geom_point(size=3, color="red")
ggplot(airquality, aes(x=Day, y=Temp)) + geom_line()
ggplot(airquality, aes(x=Day, y=Temp)) + geom_line() + geom_point()
ggplot(airquality, aes(x=Day, y=Temp)) + geom_line(color="green") + geom_point(size=3)

# 빈도 막대 그래프
ggplot(data = mpg, aes(x = drv)) + geom_bar()
# 선 그래프
ggplot(data = economics, aes(x = date, y = unemploy)) + geom_line()
# 상자 그림
ggplot(data = mpg, aes(x = drv, y = hwy)) + geom_boxplot()

str(mtcars)
?mtcars
View(mtcars)
table(mtcars$cyl)
summary(mtcars$cyl)
ggplot(mtcars, aes(x=cyl)) + geom_bar()
ggplot(mtcars, aes(x=cyl)) + geom_bar(width=0.5)
ggplot(mtcars, aes(x=factor(cyl))) + geom_bar()
ggplot(mtcars, aes(x=factor(cyl))) + geom_bar(width=0.5)
ggplot(mtcars, aes(x=factor(cyl))) + geom_bar(aes(fill=factor(gear)), alpha=1.0)
ggplot(mtcars, aes(x=factor(cyl))) + geom_bar(aes(fill=factor(gear))) + coord_polar()
ggplot(mtcars, aes(x=factor(cyl))) + geom_bar(aes(fill=factor(gear))) + coord_polar(theta='y')

ggplot(mtcars, aes(x=gear))+geom_bar() + labs(x="기어수", y="자동차수", title="변속기 기어별 자동차수") + theme_gray()
ggplot(mtcars, aes(x=gear))+geom_bar() + labs(x="기어수", y="자동차수", title="변속기 기어별 자동차수") + theme_bw()
ggplot(mtcars, aes(x=gear))+geom_bar() + labs(x="기어수", y="자동차수", title="변속기 기어별 자동차수") + theme_linedraw()
ggplot(mtcars, aes(x=gear))+geom_bar() + labs(x="기어수", y="자동차수", title="변속기 기어별 자동차수") + theme_light()
ggplot(mtcars, aes(x=gear))+geom_bar() + labs(x="기어수", y="자동차수", title="변속기 기어별 자동차수") + theme_dark()
ggplot(mtcars, aes(x=gear))+geom_bar() + labs(x="기어수", y="자동차수", title="변속기 기어별 자동차수") + theme_minimal()
ggplot(mtcars, aes(x=gear))+geom_bar() + labs(x="기어수", y="자동차수", title="변속기 기어별 자동차수") + theme_classic()
ggplot(mtcars, aes(x=gear))+geom_bar() + labs(x="기어수", y="자동차수", title="변속기 기어별 자동차수") + theme_void()


imsi <- ggplot(mtcars, aes(x=gear))+geom_bar() + labs(x="기어수", y="자동차수", title="변속기 기어별 자동차수")
str(imsi)
imsi + theme_gray()
imsi + theme_bw()
imsi + theme_linedraw()
imsi + theme_light()
imsi + theme_dark()
imsi + theme_minimal()
imsi + theme_classic()
imsi + theme_void()


ggplot(airquality, aes(x=Day, y=Temp, group=Day)) + geom_boxplot()
ggplot(airquality, aes(Temp)) + geom_histogram()


install.packages("xlsx")#00LOCK 제거하기 위해  문서 폴더에서 삭제
library(xlsx)
classDF <- read.xlsx("data/data.xlsx", 1, encoding="UTF-8")
str(classDF)
View(classDF)

bar_data <- classDF[3]
bar_data
str(bar_data)
table(bar_data$bloodType)
ggplot(bar_data, aes(x=bloodType)) + geom_bar()#기본값 fill = 검은값
ggplot(classDF, aes(x=bloodType)) + geom_bar(aes(fill=gender))


# A, B회사의 매출 실적 데이터프레임 만들기
company <- c('A', 'A', 'A', 'A', 'B', 'B', 'B', 'B')
year <- c('1980', '1990', '2000', '2010', '1980', '1990', '2000', '2010')
sales <- c(2750, 2800, 2830, 2840, 2760, 2765, 2775, 2790)

coSalesDF <- data.frame(company, year, sales)

# 생성된 coSalesDF 확인
coSalesDF
str(coSalesDF)
# 라인차트 생성 - x축은 연도(year), y축은 매출(sales) 매칭
ggplot(coSalesDF, aes(x=year, y=sales)) + geom_line()
ggplot(coSalesDF, aes(x=year, y=sales)) + geom_line(aes(group=company)) # 컬러가 없어서 어느 회사인지가 구분이 안된다.
# 선 색상 및 두께 설정 #size: 두깨 설정, colour : 선색
ggplot(coSalesDF, aes(x=year, y=sales)) + geom_line(size=2, aes(group=company,colour=company))#색을 지정해주니 구분이 된다. 
ggplot(coSalesDF, aes(x=year, y=sales)) + geom_line(size=2, aes(group=company,colour=company))+scale_colour_grey() #그레이톤
ggplot(coSalesDF, aes(x=year, y=sales)) + geom_line(size=2, aes(group=company,colour=company))+scale_colour_hue()#기본값값
ggplot(coSalesDF, aes(x=year, y=sales)) + geom_line(size=2, aes(group=company,colour=company))+scale_colour_manual(values = c("orange", "green"))
# 선의 종류 :  0 = blank, 1 = solid, 2 = dashed, 3 = dotted, 4 = dotdash, 5 = longdash, 6 = twodash
ggplot(coSalesDF, aes(x=year, y=sales)) + geom_line(size=2, aes(group=company,colour=company), linetype = 3)
ggplot(coSalesDF, aes(x=year, y=sales)) + geom_line(size=2, aes(group=company,colour=company), linetype = "dotdash")
# 점의 종류와 색상
ggplot(coSalesDF, aes(x=year, y=sales)) + geom_line(size=2, aes(group=company, colour=company)) + geom_point(size=2, shape = 5)#shape 마름모 ->R데이터 시각화 pdfvkdlfdp 
ggplot(coSalesDF, aes(x=year, y=sales)) + geom_line(size=2, aes(group=company, colour=company)) + geom_point(size=2, shape = '가')
ggplot(coSalesDF, aes(x=year, y=sales)) + geom_line(size=2, aes(group=company, colour=company)) + geom_point(size=2, shape = '가', colour = "Red")

library(MASS)
str(Cars93)
ggplot(Cars93, aes(x=Weight, y=MPG.highway)) + geom_point(shape=21, size=6)
ggplot(Cars93, aes(x=Weight, y=MPG.highway)) + geom_point(shape=21, size=6, colour="blue")
ggplot(Cars93, aes(x=Weight, y=MPG.highway)) + geom_point(shape=21, size=6, fill="blue")  
ggplot(Cars93, aes(x=Weight, y=MPG.highway)) + geom_point(shape=21, size=6, fill="blue", colour="pink") 
ggplot(Cars93, aes(x=Weight, y=MPG.highway)) + geom_point(colour="grey", shape=21, size=6) 
ggplot(Cars93, aes(x=Weight, y=MPG.highway, fill=Price)) + geom_point(colour="grey", shape=21, size=6) 
ggplot(Cars93, aes(x=Weight, y=MPG.highway)) + geom_point(colour="grey", shape=21, size=6, aes(fill=Price)) 
ggplot(Cars93, aes(x=Weight, y=MPG.highway, fill=Cylinders)) +  geom_point(colour="grey", shape=21, size=6)
ggplot(Cars93, aes(x=Weight, y=MPG.highway, fill=Cylinders)) +#Cylinders : 칼라가 조금씩 변한다.
  geom_point(colour="grey", shape=21, size=6) +
  scale_fill_brewer(palette="Oranges") # Oranges 계통의 칼라들로 채운다.
# scale_fill_brewer: 속에 채우는 것 scale color:테두리

ggplot(Cars93, aes(x=Weight, y=MPG.highway, fill=Cylinders)) +
  geom_point(colour="grey", shape=21, size=6) +
  scale_fill_brewer(palette="Reds") # Reds

ggplot(Cars93, aes(x=Weight, y=MPG.highway, fill=Cylinders)) +
  geom_point(colour="grey", shape=21, size=6) +
  scale_fill_brewer(palette="Blues") # Blues


w <- data.frame(year=c("2014", "2015", "2016", "2017", "2018"), 
                weight=c(65,66,64,68,72))
ggplot(data=w, aes(x=year)) + geom_bar()#count를 해주기 때문에 해당하는 값만큼 지정해준다.
ggplot(data=w, aes(x=year, y=weight)) + geom_bar() 
# 갯수를 세서 막대를 그리는게 기본이라.. y=weight로 준다는 것이 의미가 없다.

ggplot(data=w, aes(x=year, y=weight)) + geom_bar(stat="identity")
#stat="identity" 이렇게 하면 y축에 지정된 변수에 알맞는 값으로 그려준다.

ggplot(data=w, aes(x=year, y=weight)) + geom_bar(stat="identity") + coord_cartesian(ylim=c(60, 75))
#ylim=c(60, 75) :60값이 시작으로 해서 보여준다.

ggplot(data=w, aes(x=year, y=weight)) + geom_bar(stat="identity") + ylim(60, 75)
ggplot(data=w, aes(x=year, y=weight)) + geom_bar(aes(fill=year), stat="identity") + coord_cartesian(ylim=c(60, 75))#fill로 컬러지정
ggplot(data=w, aes(x=year, y=weight)) + geom_bar(aes(fill=year), colour="blue", stat="identity") + coord_cartesian(ylim=c(60, 75))#테두리 colour="blue"
ggplot(data=w, aes(x=year, y=weight)) + geom_bar(aes(fill=year), stat="identity") + geom_label(aes(label=weight))+coord_cartesian(ylim=c(60, 75)) #데이터 라벨 : 값을 보여준다.
ggplot(data=w, aes(x=year, y=weight)) + geom_bar(aes(fill=year), stat="identity") + geom_label(aes(label=weight), nudge_y=1)+coord_cartesian(ylim=c(60, 75)) #nudge에 따라서 라벨의 위치가 조금씩 바뀐다.
ggplot(data=w, aes(x=year, y=weight)) + geom_bar(aes(fill=year), stat="identity") + geom_label(aes(label=weight), nudge_y=2)+coord_cartesian(ylim=c(60, 75))
ggplot(data=w, aes(x=year, y=weight)) + geom_bar(aes(fill=year), stat="identity") + geom_label(aes(label=weight), nudge_y=-1)+coord_cartesian(ylim=c(60, 75)) + labs(title = "테스트", subtitle="ggplot2 패키지를 이용한 시각화", x="년도", y="무게")
# 위에 제목도 함께 붙여준다.

# ggplot 전용 저장
ggsave("ggplot_test.png")

# 트리맵 라이브러리 설치
install.packages("treemap")
# 트리맵 메모리 로드
library(treemap)

sales_df <- read.xlsx("data/data.xlsx", 2, encoding="UTF-8")
# 트리맵 그리기
# index에 표현하고 싶은 계층 순서대로 벡터로 생성. product, region 순으로 벡터를 지정함으로써 product가 region보다 더 상위로 구분이 됨
treemap(sales_df, vSize="saleAmt", index=c("product", "region"), title="A기업 판매현황")
# 지역중심
# 트리맵 그리기
treemap(sales_df, vSize="saleAmt", index=c("region", "product"), title="A기업 판매현황22")
# 제품 중심

# 인터랙티브 그래프 만들기
# 패키지 준비하기
install.packages("plotly")
library(plotly)
# ggplot으로 그래프 만들기
p <- ggplot(data = mpg, aes(x = displ, y = hwy, col = drv)) + geom_point()
#p라는 변수로 담으면 그려지는 것이 아니라 p라는 변수 안에 넣어지는 결과가 된다.
p 

# 인터랙티브 그래프 만들기
ggplotly(p) #클릭하면 없애주고 더블클릭하면 사라진다.

# 인터랙티브 막대 그래프 만들기
p <- ggplot(data = diamonds, aes(x = cut, fill = clarity)) + geom_bar()
ggplotly(p)

# 인터랙티브 막대 그래프 만들기
p <- ggplot(data = diamonds, aes(x = cut, fill = clarity)) + geom_bar(position = "dodge")
ggplotly(p) # dodge 옆으로 그려준다.

p <- ggplot(mpg, aes(x=displ, y=hwy,  color= manufacturer))+geom_point()
ggplotly(p)


ggplot(mpg, aes(x=displ, y=hwy,  color= manufacturer))+geom_point()#제조사별로 컬러를 하겠다.
ggplot(mpg, aes(x=displ, y=hwy,  color= manufacturer))+geom_point() + scale_color_manual(values = rainbow(15))
ggplot(mpg, aes(x=displ, y=hwy,  color= manufacturer))+geom_point() + scale_color_manual(values = topo.colors(15))
ggplot(mpg, aes(x=displ, y=hwy,  color= manufacturer))+geom_point() + scale_color_brewer(palette = 'Set3')
#행 설정
ggplot(mpg, aes(x=displ, y=hwy,  color= manufacturer))+
  geom_point()+guides(color = guide_legend(nrow = 6))#15개를 행을 6개로 구분하여 출력해준다.

#열 설정
ggplot(mpg, aes(x=displ, y=hwy,  color= manufacturer))+
  geom_point()+ scale_fill_brewer(palette="Reds")+ guides(color = guide_legend(ncol = 2)) 
#ncol = 2 두개의 열로 구성된 범례를 적용 가능

# 범례 항목들 역순으로
ggplot(mpg, aes(x=displ, y=hwy,  color= manufacturer))+
  geom_point()+guides(color = guide_legend(reverse = TRUE))

# 범례 없애기
ggplot(mpg, aes(x=displ, y=hwy,  color= manufacturer))+
  geom_point()+guides(color=F)

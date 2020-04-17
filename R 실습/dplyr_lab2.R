install.packages("ggplot2")
library(ggplot2)
#1. ggplot2 패키지에서 제공되는 mpg 라는 데이터 셋의 구조를 확인한다.
#이 mpg 를 데이터프레임으로 변환하여 mpg 에 저장한다.(as.data.frame())
mpg <- as.data.frame(ggplot2::mpg)
#1-1 mpg의 구조를 확인한다.
str(mpg)
#1-2 mpg 의 행의 개수와 열의 개수를 출력한다.
#행의갯수
nrow(mpg)
#열의 갯수
ncol(mpg)
#1-3 mpg의 데이터를 앞에서 10개 출력한다.
mpg %>%head(10)
#1-4 mpg의 데이터를 뒤에서 10개 출력한다.
mpg %>%tail(10)
#1-5. mpg의 데이터를 GUI 환경으로 출력한다.
View(mpg)
#1-6 mpg를 열 단위로 요약한다.
summary(mpg)
#1-7 mpg 데이터셋에서 제조사별 차량의 수를 출력한다.
mpg %>% group_by(manufacturer) %>%summarise(count=n())
#1-8 mpg 데이터셋에서 제조사별 그리고 모델별 차량의 수를 출력한다.
mpg %>% group_by(manufacturer,model)%>%summarise(count=n())

#mpg 데이터의 변수명은 긴 단어를 짧게 줄인 축약어로 되어있습니다.
#cty :도시연비, hwy:고속도로 연비
# 2-1 cty는 city로 hwy는 highway로 변수명을 수정하세요
mpg<-rename(mpg,city=cty,highway=hwy)
#2-2데이터 일부를 출력해서 변수명이 바뀌었는지 확인해보세요
mpg %>% head(5)

#3. 다음에 제시된 문제를 각각 3-1, 3-2, 3-3, 3-4로 넘버링 하여 해결 코드를 R로 작성한다.
#ggplot2 패키지에는 미국 동부중부 437개 지역의 인구통계 정보를
#담은 midwest라는 데이터가 포함되어 있다.

#3-1 ggplot2의 midwest 데이터를 데이터 프레임 형태로 불러와서 데이터의 특성을 파악하세요
midwest<-as.data.frame(midwest)

#3-2 poptotal(전체 인구)을 total로, popasian(아시아 인구)을 asian으로 변수명을 수정하세요.
midwest<-rename(midwest,total=poptotal,asian=popasian)
midwest %>% head(5)

#3-3. total, asian 변수를 이용해 '전체 인구 대비 아시아 인구 백분율' 파생변수를 만들어 보세요
midwest<-midwest %>% mutate(back=asian/total*100)

#3-4 아시아 인구 백분율 전체 평균을 구하고, 평균을 초과하면 "large", 그 외에는 "small"을 부여하는 파생변수를 만들어 보세요.
(asianM<-midwest %>% summarise(count=mean(back)))
asianM
midwest %>% mutate(midwest=ifelse(back>=asianM$count,"large","small"))

#4. 다음에 제시된 문제를 각각 4-1, 4-2, 4-3 으로 넘버링 하여 해결 코드를 R로 작성한다.
#4-1 displ(배기량)이 4이하 5이상인 자동차 중 어떤 
#자동차의 hwy(고속도로 연비)가 평균적으로 더 높은지 알아보세오
#mpg %>% filter(displ<=4|displ>=5)%>%group_by(displ<=4,displ>=5) %>% summarise(mean(hwy))
mpg %>% filter(displ<=4)%>%group_by(displ<=4) %>% summarise(mean(hwy))
mpg %>% filter(displ>=5)%>%group_by(displ>=5) %>% summarise(mean(hwy))


install.packages("sqldf")
summary(mpg)
#4-2audi와 toyota 중 어느 manafacturer 의 cty(도시연비)가 더 높은지 알아보세요
mpg %>% filter(manufacturer=='audi'|manufacturer=='toyota') %>% group_by(manufacturer) %>% summarise(mean(cty))
#4-3 chevrilet ford honda 자동차의 고속도로 연비 평균을 알아보려고 합니다.
# 이회사들의 자동차를 추출한 뒤 hwy 전체 평균을 구해보세요
mpg %>% filter(manufacturer=='chevrolet'|manufacturer=='ford'|manufacturer=='honda') %>% group_by(manufacturer) %>% summarise(mean(hwy))

#5-1 mpg데이터는 11개 변수로 구성되어 있다.
# mpg데이터에서 class(자동차의 종류), cty(도시연비)
#변수를 추출해 새로운 데이터를 만드세요 
mpgNew<-mpg %>% select(class,cty)
mpgNew %>% head(5)
#5-2
mpgNew %>% filter(class=='suv'|class=='compact')%>% group_by(class) %>% summarise(mean(cty))

#6
mpg %>% filter(manufacturer=='audi') %>% arrange(desc(hwy)) %>% head(5)

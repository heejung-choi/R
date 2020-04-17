summary(mpg)
#7-1 mpg 데이터 복사본을 만들고 cty, hwy를 합한 합산 연비 변수를 추가하세요
mpg <- as.data.frame(ggplot2::mpg)
mpg2 <- as.data.frame(ggplot2::mpg)
mpg2<- mpg %>% mutate(합산연비변수=cty+hwy)
#7-2 앞에서 만든 합산연비 편수를 2로 나눠 평균 연비 변수를 추가하세요
mpg2<-mpg %>% mutate(평균연비변수=합산연비변수/2)
#7-3 평균 연비 변수가 가장 높은 자동차 3종의 데이터를 출력하세요
mpg2 %>% arrange(desc(평균연비변수))%>% head(3)
#7-4 1~3번문제를 해결할 수 있는 구문을 활용해 하나로 된 구문
 mpg %>% mutate(합산연비변수=cty+hwy) %>% mutate(평균연비변수=합산연비변수/2)%>% arrange(desc(평균연비변수))%>% head(3)
#8-1 
mpg %>% group_by(class)%>%summarise(meanCty=mean(cty))->차종별연비
#8-2
차종별연비 %>% arrange(desc(meanCty))
#8-3 hwy평균이 가장 높은 회사 세곳
차종별연비 %>% arrange(desc(meanCty)) %>% head(3)
#8-4 경차 차종 
mpg%>%filter(class=='compact') %>% group_by(manufacturer) %>% summarise(차종수=n()) %>% arrange(desc(차종수))
#9
fuel<-data.frame(fl=c("c","d","e","p","r"),
                 price_fl=c(2.35,2.38,2.11,2.76,2.22),
                 stringsAsFactors = F)
fuel
#9-1
mpg$fl
mpg <- full_join(mpg, fuel, by = "fl")
#9-2
mpg %>% select(model,fl,price_fl) %>% head(5)

#10
midwest <- as.data.frame(ggplot2::midwest)
summary(midwest)
#10-1
midwest<-midwest %>% mutate(미성년비율=100-(popadults/poptotal*100))
#10-2
midwest %>% arrange(desc(미성년비율)) %>% head(5)
#10-3
midwest<-midwest %>% mutate(미성년비율등급=ifelse(미성년비율>=40,"large",ifelse(미성년비율>=30|미성년비율<40,"middle","small")))
midwest %>% group_by(미성년비율등급) %>% summarise(n())

#11
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(65,124,131,153,212),"hwy"]<-NA
#11-1
is.na(mpg$drv)   
is.na(mpg$hwy) 
mpg$drv
#11-2
mpg%>% filter(!is.na(hwy)) %>% group_by(drv)%>% summarise(mean(hwy))

#12
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(10,14,58,93),"drv"]<-"k"
mpg[c(29,43,129,203),"cty"]<-c(3,4,39,42)

#12-1
mpg$drv <- ifelse(mpg$drv %in% c("4", "f", "r"), mpg$drv, NA)
# 이상치 확인
table(mpg$drv)

#12-2
boxplot(mpg$cty)$stats
mpg$cty <- ifelse(mpg$cty < 9 | mpg$cty > 26, NA, mpg$cty)
boxplot(mpg$cty)

#12-3
mpg %>%
  filter(!is.na(drv) & !is.na(cty)) %>%  group_by(drv) %>%summarise(mean(cty))  

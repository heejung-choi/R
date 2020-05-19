library(dplyr)
library(ggplot2)


font_add_google("Nanum Gothic", "nanumgothic")
# 도라지 
food1<-read.csv(file="C:/heejung/Rstudy/도라지.csv",header=T)
ggplot(food1,aes(x=도라지,y=영양소명))+geom_bar(stat="identity",fill=terrain.colors(20))+theme_bw()+
  theme(axis.text=element_text(size=30),axis.title=element_text(size=30),legend.position="top")+geom_text(size=10,aes(label=도라지), vjust=0.3, colour="grey",check_overlap=TRUE)
ggsave('food11.png', width=16, height=10, dpi=100)

# 배
food2<-read.csv(file="C:/heejung/Rstudy/배.csv",header=T)
ggplot(food2,aes(x=배,y=영양소명))+geom_bar(stat="identity",fill=terrain.colors(20))+theme_bw()+
  theme(axis.text=element_text(size=30),axis.title=element_text(size=30),legend.position="top")+
  geom_text(size=10,aes(label=배), vjust=0.3, colour="grey",check_overlap=TRUE)
ggsave('food12.png', width=16, height=10, dpi=100)
# 생강
food3<-read.csv(file="C:/heejung/Rstudy/생강.csv",header=T)
ggplot(food3,aes(x=생강,y=영양소명))+geom_bar(stat="identity",fill=terrain.colors(20))+theme_bw()+
  theme(axis.text=element_text(size=30),axis.title=element_text(size=30),legend.position="top")+
  geom_text(size=10,aes(label=생강), vjust=0.3, colour="grey",check_overlap=TRUE)
ggsave('food13.png', width=16, height=10, dpi=100)
#무
food4<-read.csv(file="C:/heejung/Rstudy/무.csv",header=T)
ggplot(food4,aes(x=무,y=영양소명))+geom_bar(stat="identity",fill=terrain.colors(20))+theme_bw()+
  theme(axis.text=element_text(size=30),axis.title=element_text(size=30),legend.position="top")+
  geom_text(size=10,aes(label=무), vjust=0.3, colour="grey",check_overlap=TRUE)
ggsave('food14.png', width=16, height=10, dpi=100)

#마늘
food5<-read.csv(file="C:/heejung/Rstudy/마늘.csv",header=T)
ggplot(food5,aes(x=마늘,y=영양소명))+geom_bar(stat="identity",fill=terrain.colors(20))+theme_bw()+
  theme(axis.text=element_text(size=30),axis.title=element_text(size=30),legend.position="top")+
  geom_text(size=10,aes(label=마늘), vjust=0.3, colour="grey",check_overlap=TRUE)
ggsave('food15.png', width=16, height=10, dpi=100)

?geom_text


family()

비트
양파
현미
메밀
돼지감자
여주
인삼
양배추
토마토
민들레차
느타리버섯
연글
고구마
브로콜리
시금치


?RColorBrewer
brewer.pal(20, name)
a<-p + scale_fill_brewer(palette =set2)
a
View(food2)

head(food2)

food$도라지

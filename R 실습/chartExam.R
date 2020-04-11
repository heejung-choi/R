#문제1
#1. 제품당 클릭 갯수에 대한 데이터를 가지고 다음 조건으로 그래프를 그린다.
#세로 바 그래프를 그리는데... 				
#칼라는 terrain.colors 칼라로 설정한다.
#그래프 메인 제목 : "세로바 그래프 실습"
#clicklog1.png 에 저장한다.
data<-read.table(file="data/product_click.log")
#v1 시간 #v2는 p
page<-data$V2
plot(page, xlab="상품ID",ylab="클릭수",col=terrain.colors(10))
title(main="세로바 그래프 실습")
dev.copy(png,"clicklog1.png")
dev.off()

#문제2
#상품이 클릭된 시간 정보를 가지고 다음 조건의 그래프를 그린다.  
#파이그래프를 그리는데...				
#칼라는 자율이다. 
#그래프 메인 제목 : "파이그래프 실습"
#clicklog2.png 에 저장한다.
data<-read.table(file="data/product_click.log")
time<-data$V1
time<-as.factor(substr(time, 9, 10))
time
pieLevel<-c("0~1","1~2","2~3","3~4","4~5","5~6","7~8","9~10","10~11","11~12","12~13","13~14","14~15","15~16","16~17","17~18","18~19")             
pie(summary(time), labels=pieLevel)
dev.copy(png,"clicklog2.png")
dev.off()




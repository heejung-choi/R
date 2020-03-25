#문제 9
iotest2<-scan(file="data/iotest2.txt", what="") 
#what 없으면 에러
a<-table(iotest2)
cat("가장 많이 등장한 단어는",names(a[which.max(a)]),"입니다.")
#which.max 가장 많은 것의 인덱스를 사용

data<-scan(file="data/iotest2.txt", what="") 
data<-factor(data)
word<-names(which.max(summary(data)))
paste("가장 많이 등장한 단어는",word,"입니다.")

# 문제 1
countEvenOdd <- function(x){
even<-0
odd<-0
if(is.vector(x)&& !is.list(x)){ 
  for(i in 1:length(x)){
    if(x[i]%%2==0){
      even<-even+1
    }
    else{
      odd<-odd+1
    }
  }
}
else{
return()
}
return(list(even=even,odd=odd))
}
  
countEvenOdd(c(10,5,2,4))

# 문제 2
vmSum <- function(x){
sum<-0
if(is.vector(x)&& !is.list(x)){
  for(i in 1:length(x)){
  if(is.numeric(x[i])){
  sum<-sum+x[i]
  }else{
  print('숫자 백터만 전달하숑!')}
}}else{
  return('백터만 전달하숑!')
}
return(sum)}

vmSum(c(10,5,2,4))
vmSum(c(10,5,2,'가'))

# 문제 3
vmSum2<-function(x){
sum<-0
if(is.vector(x)&!is.list(x)){
  for(i in 1:length(x)){
    if(is.numeric(x[i])){
      sum<-sum+x[i]
    }else{
      sum<-0
      warning("숫자 벡터를 전달하숑!")
    }
}}else{
stop("백터만 전달하숑!.")
} 
return(sum)}
vmSum2(c(10,5,2,4))
vmSum2(c('하이',1))

# 문제 3
vmSum2<-function(x){
  sum<-0
  if(is.vector(x)&& !is.list(x)){
      if(is.numeric(x)){
        sum<-sum(x)
      }else{
        sum<-0
        warning("숫자 벡터를 전달하숑!")
      }
    }else{
      stop("백터만 전달하숑!.")
      #여기서 끝
    } 
  return(sum)}
vmSum2(c(10,5,2,4))
vmSum2(c('하이',1))



#문제 4
#replace 변수 봐보기기
mySum <-function(x){
oddSum<-0
evenSum<-0
re<-0
if(is.null(x)){
  
}
else{
if(is.vector(x)& !is.list(x)){ 
  for(i in 1:length(x)){
  if(is.na(x[i])){
    warning("NA를 최저값으로 변경하여 처리") 
    x[i]<-min(!is.na(x))
    #na.rm 기억 ->na값 제거해줌
  }
  else if(is.numeric(x[i])){
    if(x[i]%%2==0){
      evenSum<-evenSum+x[i]  
    }else{
      oddSum<-oddSum+x[i]
    }
  }
  }
  return(list(evenSum=evenSum,oddSum=oddSum))
 }
else{
stop("백터만 처리가능!!")
return()
}}
}
mySum(c(10,5,2,3))
mySum(c(10,NA,20,40))

# 문제 5
myExpr <-function(x){
if(is.function(x)){
sam<-sample(1:45,6)
return(x(sam))
}else{
stop("수행 안할거임!!")  
} 
}
myExpr(sum)

# 문제 6
createVector1<-function(...){
result<-c(...);
if(is.null(x)){
  return() 
}
else if(any(is.na(x))){
  return('NA') 
  }

return(result)
}

createVector1('가','나')
createVector1('가','2',NA)

#문제 7
createVector2<-function(...){
args <-list(...) #여기서 list로 해줘야 한다.
nvec<-NULL #c()로 해도 된다.
cvec<-NULL
lvec<-NULL
for(data in args){
  if(is.numeric(data)){
    nvec<-c(nvec,data)
  }
  else if(is.character(data)){
    cvec<-c(cvec,data)
  }
  else if(is.logical(data)){
    lvec<-c(lvec,data)
  }
}
return(list(숫자형=nvec,문자열=cvec,논리형=lvec))
}

createVector2('test',1,1,TRUE)

#append 사용해서 해도 됨 

#문제 8
numb<-scan("data/iotest1.txt")
numb1<-sort(numb)
numb2<-sort(numb,decreasing=T)
numb3<-sum(numb)
numb4<-min(numb)
cat("오름차순:",numb1,"\n")
cat("내림차순:",numb2,"\n")
cat("합:",numb3,"\n")
cat("평균:",numb4,"\n")


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

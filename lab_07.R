# 문제 1
countEvenOdd <- function(x){
  even<-0
  odd<-0

  if(is.vector(x)& !is.list(x)){ 
    for(i in 1:length(x)){
    if(x[i]%%2==0){
      even<-even+1
    }
    else{
      odd<-odd+1
    }
  }}
  else{
    even<-'null'
    odd<-'null'
  }
  return(list(even,odd))}
  
countEvenOdd(c(10,5,2,4))

# 문제 2
vmSum <- function(x){
sum<-0
if(is.vector(x)&!is.list(x)){
  for(i in 1:length(x)){
  if(is.numeric(x[i])){
  sum<-sum+x[i]
  }else{
  sum<-'숫자 백터만 전달하숑!' }
}}else{
sum<-'백터만 전달하숑!'
}
return(sum)}

vmSum(c(10,5,2,4))

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

#문제 4
mySum <-function(x){
oddSum<-0
evenSum<-0
re<-0
if(is.vector(x)& !is.list(x)){ 
  for(i in 1:length(x)){
  if(is.na(x[i])){
    warning("NA를 최저값으로 변경하여 처리") 
    x[i]<-min(!is.na(x))
  }
  else if(is.numeric(x[i])){
    if(x[i]%%2==0){
      oddSum<-oddSum+x[i]  
    }else{
      evenSum<-evenSum+x[i]
    }
  }
  if(is.null(x[i])){
  return() }
  }
  return(list(oddSum,evenSum))
 }
else{
stop("백터만 처리가능!!")
return()
}
}
mySum(c(10,5,2,3))
mySum(c(10,NA,20))

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
for(i in 1:length(x)){
  if(is.null(x[i])){
    return() 
  }
  else if(is.na(x[i])){
    return('NA') 
  }
}
}

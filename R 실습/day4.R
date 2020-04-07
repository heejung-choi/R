x <- 70
#함수 밖의 x는 전역변수
func5 <- function() {
  x <- 10
  #여기서 만들어진 변수는 지역변수 -> 수행이 끝나면 없어지는 변수
  y <- 20
  x <<- 40  # 외부 변수(전역 변수) x 를 수정
  return (x+y) #변수를 값으로 사용할 때에는 지역변수가 먼저 사용됨
}
func5()  
x   #이때는 전역변수 x가 출력됨 func5에서 바꿨기 때문에 40이 출력~  

#전역변수/지역변수
a<-3;b<-7;c<-11 
ft<-function(a){
  b<-a+10     
  c<<-a+10   # 전역대입연산 
  d<-a
  print(a);print(b);print(c);print(d)
  return()  # NULL
}
print(ft(100))
print(a);print(b);print(c);print(d) 

#invisible()함수 
#visible하지 않은 return함수
#return값을 주고는 싶은데, 사용만하게끔 하고싶음

ft.1 <- function(x) return()
ft.2 <- function(x) return(x+10)
ft.3 <- function(x) invisible(x+10)

ft.1(100)
ft.2(100)
ft.3(100)

r1 <- ft.1(1000);r1
r2 <- ft.2(1000);r2
r3 <- ft.3(1000);r3


testParamType <- function(x){
  if(is.vector(x)) print("벡터를 전달했군요!")
  if(is.data.frame(x)) print("데이터프레임을 전달했군요!")
  if(is.list(x)) print("리스트를 전달했군요!")
  if(is.matrix(x)) print("매트릭스를 전달했군요!")
  if(is.array(x)) print("배열을 전달했군요!")
  if(is.function(x)) print("함수를 전달했군요!")
}
#dataframe이 list에, list는 vector에 포함 됨 
#list는 원소 1개 짜리 1차원 배열과 같다.
testParamType(100) #원소 하나짜리 벡터
testParamType(LETTERS) #내장 벡터
testParamType(data.frame())
#데이터 프레임 -> 똑같은 갯수로 구성된 벡터들을 엮어둔 list
#is.data.frame()&is.list()모두 참이됨!
testParamType(matrix())
#matrix는 2차원 Array라고 보면 됨
#is.matrix()와 is.array()모두 참!
testParamType(list())
#list는 벡터의 확장이라고 볼 수 있음
#is.list()와 is.vector()모두 참
testParamType(array())
testParamType(mean)


#testParamType
testParamType1 <- function(x){
  result <- NULL
  if(is.vector(x)  && !is.list(x)) result <-"벡터를 전달했군요!"
  else if(is.data.frame(x)) result <- "데이터프레임을 전달했군요!"
  else if(is.list(x)) result <- "리스트를 전달했군요!"
  else if(is.matrix(x)) result <- "매트릭스를 전달했군요!"
  else if(is.array(x)) result <- "배열을 전달했군요!"
  else if(is.function(x)) result <- "함수를 전달했군요!"
  return(result)
}

#dataframe이 list에, list는 vector에 포함 됨 #list는 원소 1개 짜리 1차원 배열과 같다.....?
testParamType1(c(10,5,3))
testParamType1(100)
testParamType1(LETTERS)
testParamType1(data.frame())
testParamType1(matrix())
testParamType1(list())
testParamType1(array())
testParamType1(function(){})

#stop() 함수
#stop은 에러를 발생시키는 함수
testError1 <- function(x){
  if(x<=0)
    stop("양의 값만 전달 하숑!! 더 이상 수행 안할거임..")
  #괄호 안에 있는 text로 에러메세지를 내보냄.
  return(rep("테스트",x))
}

testError1(5)
testError1(0)



#warning() 함수
#경고를 나타내는 함수
#수행 중단을 하지는 않지만, 나머지기능은 마저 수행하고 return됨
testWarn <- function(x){
  if(x<=0)
    stop("양의 값만 전달 하숑!! 더 이상 수행 안할거임..")
  if(x>5){
    x<-5
    warning("5보다 크면 안됨!! 하여 5로 처리했삼...!!")
  }
  return(rep("테스트",x))
}

testWarn(-3)
testWarn(3)
testWarn(10)

test1 <-function(p){
  cat("난 수행함\n")
  testError(-1)
  cat("나 수행할 까요? \n")  #어떤 이유에서든 위에 문제가 발생할 경우 여기는 수행이 되지 않음
}
test1()
#아규먼트로 p를 받았더라도 함수내에서 사용하지 않는다면, 아규먼트를 주지 않는 함수를 사용 가능

#즉, p가 무시된 상태에서 진행됨

#try()
#java에서 try catch사용과 비슷. 예외가 발생하면 캐치는 하지만 그냥 넘어가겠어~
test2 <- function(p){
  cat("난 수행함\n")
  try(testError(-1))
  cat("나 수행할 까요? \n")
}
test2()

#자바의 try-catch와 구조가 완전 같음
testAll <-function(p){
  tryCatch({
    if(p=="오류테스트"){
      testError1(-1)
    }else if (p =="경고테스트"){
      testWarn(6)
    }else{
      cat("정상 수행..\n")
      print(testError1(2))
      print(testWarn(3))
    }
  },warning = function(w){
    print(w)
    cat("-.-;;\n")
  }, error = function(e){
    print(e)
    cat("ㅠㅠ \n")
  },finally ={
    cat("오류, 경고 발생 여부에 관계없이 반드시 수행되는 부분입니다요..\n")
  })
}
#warning, error, finally는 선택적으로 표시함

testAll("오류테스트")
testAll("경고테스트")
testAll("아무거나")


f.case1 <- function(x) {
  if(is.na(x)) 
    return("NA가 있슈")
  else
    return("NA가 없슈")
}
#is.na()함수 사용체크!
f.case1(100)
f.case1(NA)
#여기서부터는 경고창 발생
#반복문 써서 체크를 했어야 함 -> 수행은 하지만 잔소리가 많아~~
#is.na()는 하나의 값에 따라 체크하기 때문에, 첫번째 요소에 따라 결과값이 달라짐
f.case1(1:6)
f.case1(c(10,20,30))
f.case1(c(NA, 20))
f.case1(c(10, NA, 20))


#any() 와 all()함수
f.case2 <- function(x) {
  if(any(is.na(x))) 
    return("NA가 있슈")
  else
    return("NA가 없슈")
}
f.case2(100)
f.case2(NA)
f.case2(1:6)
f.case2(c(10,20,30))
f.case2(c(NA, 20))
f.case2(c(10, NA, 20))

f.case3 <- function(x) {
  if(all(is.na(x))) 
    return("모두 NA임")
  else
    return("모두 NA인 것은 아님")
}
f.case3(100)
f.case3(LETTERS)
f.case3(NA)
f.case3(c(NA, NA, NA))
f.case3(c(NA, NA, 10))


#Sys.sleep(초시간) 함수
#(초단위)로 나타냄
#크롤링(렌더링)할 때, 중간중간 프로그램이 대기상태가 되도록 함.
#시간이 오래걸려 비효율적일 것 같지만, 오히려 서버가 죽는거 보다 낫기 때문에 훨씬 효율적
testSleep <- function(x) {
  for(data in 6:10) {       
    cat(data,"\n")
    if(x)
      Sys.sleep(1)
  }
  return()
}
testSleep(FALSE)
testSleep(TRUE)




# 가변형 인자 테스트
funcArgs <- function(...) {
  p <- c(...)
  data <- 1:10
  #opts <- ifelse(length(p), p, "")
  #이렇게하면 첫번째 원소만 대입함
  if(length(p)>0)
    opts <- p
  else
    opts <-""
  print(p)
  print(opts)
  if(opts[1] == "")
    print(data)
  else{
    for(opt in opts) {
      switch(EXPR=opt,
             SUM=, Sum=, sum= print(sum(data)),
             MEAN=, Mean=, mean= print(mean(data)),
             DIFF=, Diff=, diff= print(max(data) - min(data)),
             MAX=, Max=, max= print(max(data)),
             MIN=, Min=, min= print(min(data)),
             SORT=, Sort=, sort= print(sort(data))
      )
    }
  }
}

funcArgs("mean","sum","max")
funcArgs("max")
funcArgs("sort")
funcArgs(7)

#LIST
v<-c(1,2,3)
l<-list(1,2,3) 
# v : [1] 1 2 3
# l :
#[[1]]
#[1] 1
#[[2]]
#[1] 2
#[[3]]
#[1] 3
#벡터는 연산할 수 있지만, 리스트는 연산할 수 없다.
#그럴 경우에는 un list 를 한 후 계산한다.
v*3
# l*3: Error in l * 3 : 이항연산자에 수치가 아닌 인수입니다
v[1]*3
# l[1]*3 : Error in l[1] * 3 : 이항연산자에 수치가 아닌 인수입니다
# 포장된 채로는 연산을 할 수 없다.
#그런 경우 겹대괄호를 해줘서 포장된 것을 벗기고 알맹이만 가져와야 한다. 
# $연산자도 가능한데, 이름이 있어야 사용가능하다.
l[[1]]

lds <- list(1,2,3) 
lds
unlist(lds)
unlist(lds)+100
lds+100
lds[1]
lds[1]+10
lds[[1]]+10

names(lds) <- LETTERS[1:3]
lds
lds[[2]]
lds[["B"]]
lds$B  #가장 많이 쓴다. 그러나 이름이 있어야 쓸 수있다.


a<-list(
  a = 1:3,
  b = "a string",
  c = pi,
  d = list(-1,-5)
)
a;
a[1]
a[[1]] 
a[["a"]]
#숫자 인덱스 대신 이름 인덱스를 써도 된다.
a$a
a[[1]][1]
a$a[1]
a[1]+1
a[[1]]+1
a[[1]][2] <- 100
new_a <- unlist(a[1]) #대입
a[1]; new_a
names(a) <- NULL
names(new_a) <- NULL
#알맹이만 꺼내고 싶을 때는 겹대괄호 사용용


ls()
length(ls())
#save: 저장 load: 읽음
save(list=ls(),file="all.rda") # varience will save in "all.rda" of rexam
rm(list=ls())
ls()
load("all.rda")
ls()

#read file data
#scan은 숫자를 읽어들이는데 최적화 되어 있다.
#기본은 ansi 똑같이 UTF-8을 해줘야 한다.

nums <- scan("data/sample_num.txt")
word_ansi <- scan("data/sample_ansi.txt",what="")
words_utf8 <- scan("data/sample_utf8.txt", what="",encoding="UTF-8")
words_utf8_new <- scan("data/sample_utf8.txt", what="")

#readLines 는 행단위로 읽어서 백터로 나타낸다.
#웹사이트에서 끌어오는데 한글이 UTF-8이라면 한글이 다 깨진다.
#크롤링할 때 유의해야 한다.

lines_ansi <- readLines("data/sample_ansi.txt")
#encoding="UTF-8" 으로 해주면 되는데 R은 utf-8할때 꼭 대문자로 줘야한다.
lines_utf8 <- readLines("data/sample_utf8.txt",encoding="UTF-8")

# read.csv로 하면 된다.
# 각각의 컬럼 구분할때 컴마
#read.table은 직접 명시할 수 있다.
df2 <- read.table("data/product_click.log")
# 746 obj/ 2variables;
# 시분초 인데 여기서 숫자로 바꾸었다 숫자가 크게 되면 지수형태로 내보낸다.
#read.csv는 무조건 .으로 해서 해야한다.
str(df2)
head(df2)
summary(df2$V2)


for(data in month.name) 
  print(data)


for(data in month.name) 
  cat(data,"\n")

sum <- 0
for(i in 5:15){
  if(i%%10==0){
    break
  }
  sum <- sum + i
  print(paste(i,":",sum))
}
#cat은 인덱스가 출력되지 않는다. 
#print는 데이터셋을 좀더 보기좋게 하는 기능을 내장하고 있다.
sum <- 0
for(i in 5:15){
  if(i%%10==0){
    break
  }
  sum <- sum + i
  cat(i,":",sum,"\n")
}



sum <-0
for(i in 5:15){
  if(i%%10==0){
    next;  #continue
  #건너뛰는 느낌?
  }
  sum <- sum + i
  print(paste(i,":",sum))
}

sumNumber <- 0
while(sumNumber <= 20) { 
  i <- sample(1:5, 1) 
  sumNumber <-sumNumber+i; 
  cat(sumNumber,"\n")
} 

repeat {
  cat("ㅋㅋㅋ\n")
}


sumNumber <- 0
repeat { 
  i <- sample(1:5, 1) 
  sumNumber <-sumNumber+i; 
  cat(sumNumber,"\n")
  if(sumNumber > 20)
    break;
}

#제어문
#if else
randomNum <-sample(1:10,1)
if(randomNum>5){
  cat(randomNum,":5보다 크군요","\n")
}else{
  cat(randomNum,":5보다 작거나 같군요","\n")
}

if(randomNum%%2 == 1){
  cat(randomNum,";홀수\n")
}else{
  cat(randomNum,";짝수","\n")
}


if(randomNum%%2 == 1){
  cat(randomNum,";홀수","\n")
}else{
  cat(randomNum,";짝수","\n")
}

score <- sample(0:100, 1)  # 0~100 숫자 한 개를 무작위로 뽑아서
if (score >=90){
  cat(score,"는 A등급입니다","\n")
}else if (score >=80){
  cat(score,"는 B등급입니다","\n")
}else if (score >=70){
  cat(score,"는 C등급입니다","\n")
}else if (score >=60){
  cat(score,"는 D등급입니다","\n")
}else {
  cat(score,"는 F등급입니다","\n")
}

#for문
#for 실습
for(data in month.name) 
  print(data)
# ㅋㅋ반복 안됨
for(data in month.name)print(data);print("ㅋㅋ")
# ㅋㅋ반복하려면 이렇게
for(data in month.name){print(data);print("ㅋㅋ")}

for(n in 1:5)
  cat("hello?","\n")

for(i in 1:5){
  for(j in 1:5){
    cat("i=",i,"j=",j,"\n")
  }
}
# 구구단
for(dan in 1:9){
  for(num in 1:9){
    cat(dan,"x",num,"=",dan*num,"\t") # \n : 개행문자, \t : 탭문자
  }
  cat("\n")
}

# true 체크하여 안에 반목문을 넣어준다.
# 체크한다음에 나가게끔 해준다.
bb <- F
for(i in 1:9){
  for(j in 1:9){
    if(i*j>30){
      bb<-T
      break
    } 
    cat(i,"*",j,"=",i*j,"\t")
  }
  cat("\n")
  if(bb) #bb가 TRUE이면
    break
}

#while문
i<-1
while(i <= 10){
  cat(i,"\n")
  i <- i+1
}
cat("종료 후 :",i,"\n")

i<-1
while (i<=10) {
  cat(i,"\n")
}

i<-1
while (i<=10) {
  cat(i,"\n")
  i<-i+2
}

i<-1
while (i<=10) {
  cat(i,"\n")
  i<-i+1
}

#switch 문을 대신하는 함수
month <- sample(1:12,1)
# sep를 이용해 paste에 나열된 각각의 원소 사이에 옵션을 적용하여 구분할 수 있다.
month <- paste(month,"월",sep="") # "3월"  "3 월"
result <- switch(EXPR=month,
                 "12월"=,"1월"=,"2월"="겨울",
                 "3월"=,"4월"=,"5월"="봄",
                 "6월"=,"7월"=,"8월"="여름",
                 "가을")
#어떤 변수의 값을 단순히 출력하는 것이기 때문에 cat이 더 적합하다.
cat(month,"은 ",result,"입니다\n",sep="")

num <- sample(1:10,1)
num
#expr 수치형이기 때문에 뒤에는 처리할 식만 올 수 있다.
#수치형의 경우 defalut값을 지정할 수 없다.
switch(EXPR = num,"A","B","C","D")

for(num in 1:10){
  cat(num,":",switch(EXPR = num,"A","B","C","D"),"\n")
}
#as.character 통해 문자열 로 변환
# 문자열로 변환할 경우 조건식 마지막에 요구사항을 입력해주면 defalut값이라든지, 
#조건에 해당되지 않는 값들을 나타낼 수 있다.
for(num in 1:10){
  num <- as.character(num) #paste0(num,"")#엄청 촌스러운 작업이다.
  cat(num,":",switch(EXPR = num,
                     "7"="A","8"="B","9"="C","10"="D","ㅋ"),"\n")
}

# 함수 정의와 활용

func1 <- function() {
  xx <- 10   # 지역변수
  yy <- 20
  return(xx*yy)
}
func1()

result <- func1()
result
xx  # 오류발생


func2 <- function(x,y) {
  xx <- x
  yy <- y
  return(sum(xx, yy))
}

func2()
func2(5,6) # 식 : 연산식, 호출식, 변수, 리터럴

func3 <- function(x,y) {
  #x3 <- x+1
  #y3 <- y+1
  x4 <- func2(x+1, y+1)  # 값(식) : 변수, 리터럴, 연산식, 호출식
  return(x4)
}

func3(9, 19)  # 30

func4 <- function(x=100, y=200, z) {
  return(x+y+z)
}
func4()
func4(10,20,30)
func4(x=1,y=2,z=3)
func4(y=11,z=22,x=33)
func4(z=1000)  



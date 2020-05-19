v1 <- 1:10
v2 <- v1+100
print(v2)
#R공부 열심히 해보자~

#여기서부터 제공된 소스
v1 <- c(4, 1, 8, 6, 10) #변수에 타입을 지정해주지 않음
#c(4, 1, 8, 6, 10)만 block처리 후 실행하면 원소들이 print됨
print(v1)
v1  # 변수명만 실행시키면 자동으로 print 됨.
?rep
#'?함수명' 을 입력하면 document가 열림 = help함수 -> 우측하단에 뜸!
rep(1, 100) #1을 100번 반복하시오
rep(1:3, 5) #1,2,3을 5번 반복하시오 // rep(3:1, 5)는 3부터 1까지 5번 반복
rep(1:3, times=5) 
#전달하고자 하는 값 앞에 매개변수를 붙여서 전달 가능
#이를 keyword parameter라고 함
#times가 두번째 매개변수!! 그래서 times=를 생략하더라도 매개변수 전달 가능
#times에 꼭 전달해줘~ 라는 의미
rep(1:3, each=5)
#each라는 변수에 꼭 전달해줘~ 라는 의미
#each는 꼭 알려줘야함

#R이 내장하고 있는 벡터
LETTERS
letters
month.name
month.abb
pi

LETTERS;letters;month.name;month.abb;pi
#;으로 구별하여 한번에 수행 가능

LETTERS[1]; LETTERS[c(1)]; 
#LETTERS[1];과 LETTERS[c(1)];의 값은 동일함
LETTERS[3:5]; LETTERS[c(3,4,5)];
#두 함수의 값은 동일함
LETTERS[5:3]
LETTERS[-1]; LETTERS[c(-2,-4)]
#-의 의미는 그거 빼고 나머지 출력

length(LETTERS)
length(month.name)
length(pi)


x <- c(10,2,7,4,15)
x
print(x)
class(x)
rev(x)  #배열 순서를 바꿈. 15, 4, 7...순으로 나옴
range(x) # 최소 최대값 나옴
sort(x)
sort(x, decreasing = TRUE) # decreasing의 default값은 false. 
sort(x, decreasing = T)
#x <- sort(x)  
#x를 sorting해서 새로운 벡터에 담아서 리턴하기 때문에, x를 바꾸고 싶으면 다시 x의 변수에 담아야 함
order(x)
#작은 값을 순서로 인덱스를 return하는 것.
#데이터프레임 정렬할 때 꼭 필요
#제일 작은 값은 2번째에 있어요~ 그다음 작은 값은 4번째에 있어요~ 
#default는 decreasing false

x[3] <- 20
x
x + 1
#원소마다 하는걸 뭐라하더라...... 벡터배열..?
x <- x + 1
#통계함수들
max(x);min(x);mean(x);sum(x)
summary(x)
#각각의 원소마다 이름이 붙어있음 -> 원소마다 부여된 벡터 : 네임드벡터
#주어진 벡터가 어떤 벡터인가에 따라 다르게 나타내줌. 많이 사용됨!!!
x[c(2,4)] # x[2], x[4]
#2,4번째꺼만 꺼내서 벡터로 전달
x[c(F,T,F,T,F)]
#하나하나 인덱스와 매칭해서 true인 원소만 꺼냄. 즉, logical형으로 꺼낼 수 있음
x[c(T,F)]
#5개가 와야하는데 2개만 왔기 때문에 자동으로 반복해서 x[c(T,F,T,F,T)]로 생성

x > 5
#연산결과 logical로리턴
x[x > 5]
#꺼내고자하는 index를 logical로 줌. 비교식으로 줄 수 있음. 조건을 만족하는 원소값만 추출
x[x > 5 & x < 15]   #여기서는 &하나만 써야함!!!
#x[x > 5 && x < 15] : 첫번째 원소만 가지고 안에있는 연산식을 수행함 (값 하나만가지고 비교할 때 이거씀)
#x[x > 5 | x < 15]

names(x) 
#아규먼트로 주어진 벡터에 매핑되어있는 네임벡터를 설정하거나 추출할때 사용하는 함수
#일반벡터에서 사용(네임벡터 없는경우)할 때에는 NULL이 리턴됨
names(x) <- LETTERS[1:5]
#LETTERS[1:4]로 하면 반복이 되지않고 마지막 원소의 네임벡터는 NA가 됨
names(x) <- NULL
#NULL넣어주면 다시 네임벡터 사라짐
x[2];x["B"]; 
#숫자 인덱스 대신에 원소의 이름을 사용할 수 있음
#x[B]일 경우 객체'B'를 찾을 수 없다는 에러 발생

# &, &&
c(T, T, F, F) & c(T, F, T, F)
c(T, T, F, F) | c(T, F, T, F)
c(T, T, F, F) && c(T, F, T, F)
c(T, T, F, F) || c(T, F, T, F)


ls()
#Unix/Linux와 다르게 현재까지 만든 변수들의 리스트를 보여줌
rm(x)
#rm(x) = remove
x
class(x)

rainfall <- c(21.6, 23.6, 45.8, 77.0, 
              102.2, 133.3,327.9, 348.0, 
              137.6, 49.3, 53.0, 24.9)
rainfall > 100
rainfall[rainfall > 100]
which(rainfall > 100)
#결과값이 참인 index값이 리턴됨
month.name[which(rainfall > 100)]
month.abb[which(rainfall > 100)]
month.korname <- c("1월","2월","3월",
                   "4월","5월","6월",
                   "7월","8월","9월",
                   "10월","11월","12월")
#month.korname이라는 객체가 새로 생성됨 
month.korname[which(rainfall > 100)]
which.max(rainfall)
which.min(rainfall)
month.korname[which.max(rainfall)]
month.korname[which.min(rainfall)]


sample(1:20, 3)
#sample(벡터, 벡터에서 몇개 꺼낼 것인가) 랜덤함수와 동일
sample(1:45, 6)
#그중에서 중복을 제거하여!!!
sample(1:10, 7)
sample(1:10, 7, replace=T)
#replace = TRUE하면 중복값 허용

count <- sample(1:100,7)
month.korname <- c("일요일", "월요일", "화요일",
                   "수요일", "목요일", 
                   "금요일", "토요일")

paste(month.korname, count, sep = ":");
#원소별로 결합, month.korname과 count를 :을 이용하여 각각 결합
#sep의 default값은 한 칸 띄어쓰기(공백)
month.korname[which.max(count)];
#가장 큰값을 갖는 요일을 출력
month.korname[which.min(count)];
month.korname[which(count > 50)]
#50보다 큰값을 갖는 것을 찾아라!

#문자 결합 함수
paste(month.korname, count, sep = " : ")

paste("I'm","Duli","!!")
# 합치고자 하는 갯수와 관계없이 하나로 결합해줌(가변형 인자)
paste("I'm","Duli","!!", sep="")
paste0("I'm","Duli","!!")
#기본적으로 사용되는 delemeter의 차이. 나머지는 같음 (sep의 default값이 붙여 쓰는것)

fruit <- c("Apple", "Banana", "Strawberry")
food <- c("Pie","Juice", "Cake")
paste(fruit, food)
#기본값 공백!
?paste
paste(fruit, food, sep="")
#collapse를 지정하게 되면, 원소마다 결합한 후 하나의 문자열로 결합해버림
paste(fruit, food, sep=":::")
paste(fruit, food, sep="", collapse="-")
#collapse에 지정한 걸로 다닥다닥 붙게됨
paste(fruit, food, sep="", collapse="")
paste(fruit, food, collapse=",")



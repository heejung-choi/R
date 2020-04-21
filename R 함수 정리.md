# R 함수 정리

# day 1

# rep

```r
rep(1,100) #1을 100번 반복하시오
rep(1:3, 5) #1,2,3을 5번 반복하시오
rep(1:3, times=5)# 위와 같은 의미
```



# R 내장 백터

```R
LETTERS
letters
month.name
month.abb
pi
```



# R 내장 백터 활용

```R
LETTERS[1]; LETTERS[c(1)]; 
#LETTERS[1];과 LETTERS[c(1)];의 값은 동일함
LETTERS[3:5]; LETTERS[c(3,4,5)];
#두 함수의 값은 동일함
LETTERS[5:3]
LETTERS[-1]; LETTERS[c(-2,-4)]
#-의 의미는 그거 빼고 나머지 출력
```



# R 정렬 (sort, rev, range 등)

```R
x <- c(10,2,7,4,15)
rev(x)  #배열 순서를 바꿈. 15, 4, 7...순으로 나옴
# [1] 15  4  7  2 10
range(x) # 최소 최대값 나옴
# [1]  2 15
sort(x) #최솟값 순으로 정렬 (작은값에서 큰 값 순으로)
#[1]  2  4  7 10 15
sort(x, decreasing = TRUE) #최대값 순으로 정렬
#[1] 15 10  7  4  2
sort(x, decreasing = T) # 위와 값 동일
#[1] 15 10  7  4  2
order(x) #작은값을 순서로 인덱스
#[1] 2 4 3 1 5




```

# 통계 함수

```R
# 평균
mean(x2) 
# 총합
sum(x2)
#최솟값
min(x2)
#최댓값
max(x2)
summary(x)
```



# 벡터 이름 설정

```R
names(x) 
#아규먼트로 주어진 벡터에 매핑되어있는 네임벡터를 설정하거나 추출할때 사용하는 함수
#일반벡터에서 사용(네임벡터 없는경우)할 때에는 NULL이 리턴됨
names(x) <- LETTERS[1:5]
# A  B  C  D  E 
#10  2  7  4 15 
```



# is / rm : 변수 리스트 출력/ 삭제

```R
ls()
#Unix/Linux와 다르게 현재까지 만든 변수들의 리스트를 보여줌

rm(x)
#rm(x) = remove
```



# sample : 랜덤 값 출력

```R
sample(1:20, 3)
#sample(벡터, 벡터에서 몇개 꺼낼 것인가) 랜덤함수와 동일
sample(1:45, 6)
#그중에서 중복을 제거하여!!!
sample(1:10, 7)
sample(1:10, 7, replace=T)
#replace = TRUE하면 중복값 허용
```



# paste sep=""  

```r
paste(month.korname, count, sep = ":");
#sep -> 문자사이에 해당 값을 넣어 준다.
paste(fruit, food, sep="", collapse="-");
# collapse를 지정하게 되면, 원소마다 결합한 후 하나의 문자열로 결합해준다.
# 여러개의 변수들을 한개의 변수로 합칠 때 유용하다.
```

![image-20200421194408103](C:\Users\student\AppData\Roaming\Typora\typora-user-images\image-20200421194408103.png)

# day 2

# 벡터 (vector) 

 R에서 다루는 가장 기초적인 데이터셋(데이터 구조)로서 1차원으로 사용된다.

하나의 데이터값도 벡터로 취급된다.

동일한 타입의 데이터만으로 구성된다.(문자형>숫자형>논리형)

백터 생성 방법: c(), seq(), rep()



# 팩터 (factor)

가능한 범주 값 (level)만으로 구성되는 벡터이다.

```r
data1 <- c("월","수","토","월","목","화")
week.korabbname <- c("일", "월", "화",
                     "수", "목", "금", "토")
factor(data1,levels=week.korabbname)
#팩터에 levels 값을 지정해 줄 수 있다.

levels(gender)<-c("남성","여성")
#levels에 바로 넣어줄 수도 있다.
```





# matrix

```r
x1 <-matrix(1:8, nrow = 2)
mat1; dim(mat1)
#dim -> 몇행 몇열인지 알려준다
# nrow: 행의 갯수 / ncol: 열의 갯수

vec1 <- c(1,2,3)
vec2 <- c(4,5,6)
vec3 <- c(7,8,9)

mat1 <- rbind(vec1,vec2,vec3); mat1
#     [,1] [,2] [,3]
#vec1    1    2    3
#vec2    4    5    6
#vec3    7    8    9

mat2 <- cbind(vec1,vec2,vec3); mat2
     vec1 vec2 vec3
#[1,]    1    4    7
#[2,]    2    5    8
#[3,]    3    6    9

# 행의 이름이나 열의 이름을 넣고 싶다면?
rownames(mat1) <- c("row1","row2","row3")
colnames(mat1) <- c("col1","col2","col3")
```

2차원의 벡터이다.

동일 타입의 데이터만 저장 가능

rbind 행단위, cbind 열단위



# apply

```r
apply(x2, 1, max)
apply(x2, 1, min)
apply(x2, 1, mean)

apply(x2, 2, max)
apply(x2, 2, min)
apply(x2, 2, mean)
# apply : 적용해라!
# 1은 행단위로 2은 열단위로
```



# 배열(array)

```r
a1 <- array(1:30, dim=c(2,3,5))
# 2행 3열 5층짜리 배열을 만들겠다.
a1[1,3,4]
# 1행 3열 4층 데이터 출력
a1[,,3]
#행과 열을 생략하면 모든이라는 뜻이다. 3층의 모든 식구들이 다 나온다.
```

3차원 벡터이다.

동일 타입의 데이터만 저장 가능



# 데이터 프레임(data.frame) : 2차원 구조

열단위로 서로 다른 타입의 데이터들로 구성 가능

**모든 열의 데이터 개수(행의 개수)는 동일해야 한다. **

```r
no <- c(1,2,3,4)
name <- c('Apple','Banana','Peach','Berry')
qty <- c(5,2,7,9)
price <- c(500,200,200,500)
fruit <- data.frame(no, name, qty, price)
fruit

#  no   name qty price
#1  1  Apple   5   500
#2  2 Banana   2   200
#3  3  Peach   7   200
#4  4  Berry   9   500
```





# 리스트

저장 가능한 데이터 타입, 데이터 셋의 종류에 제한이 없다.

벡터 , 행렬, 배열, 데이터프레임 등의 서로 다른 구조의 데이터를 하나로 묶을 수 있는 자료 구조 이다.

라운드 박스 list/ 그냥 박스 vector 객체



# 현재 디렉토리 찾기: getwd();

```
getwd()
```



# 내장 데이터 셋

### 특정 값 출력 (앞에서 부터 출력, 뒤에서 부터 출력)

```r
head(iris); #앞에서부터 6개 출력
tail(iris); #뒤에서부터 6개 출력
#갯수 지정해주고 싶다면 아규먼트로 숫자 지정해 줄 수 있다.
head(iris,10);
```



# 속성 확인 : STR

```r
str(iris)
# str 실행시
# IT메모리의 방이 변수
# 통계학은 속성들의 값이 변수
#'data.frame':	150 obs. of  5 variables:
# 150개의 관측치(행) 5개의 속성(변수)
```



# library()

```r
library()
# R이 설치되면서 같이 나타는 패키지를 의미한다.
# base: The R Base Package 자바와 같다.
```



# 행 , 열 이름 출력

```r
# names(df_midterm)라고 하면 열 우선이기 때문에 colnames를 보내준다.
colnames(df_midterm)
#rownames 자동으로 1234로 부여
rownames(df_midterm)
```



# csv 파일 열기

```
score <- read.csv("data/score.csv")
```



# if else

```
df$result <- ifelse(df$var1>df$var2, 
                    "var1이 크다", "var1이 작다"
```



# subset

```r
# 기본 형태
subset(x=diamonds, subset=, select= )
# 앞에 x/ subset/select 값은 생략해줘도 된다.
# x : 들어갈 변수
# subset : 조건
# select : 뽑아 낼 변수
```


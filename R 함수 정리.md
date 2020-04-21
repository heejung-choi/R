# R 함수 정리



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
sort(x) #최솟값 순으로 정렬
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
max(x);min(x);mean(x);sum(x)
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

# 벡터 (vector) 

 R에서 다루는 가장 기초적인 데이터셋(데이터 구조)로서 1차원으로 사용된다.

하나의 데이터값도 벡터로 취급된다.

동일한 타입의 데이터만으로 구성된다.(문자형>숫자형>논리형)

백터 생성 방법: c(), seq(), rep()



# 팩터 (factor)

가능한 범주 값 (level)만으로 구성되는 벡터이다.





# matrix

```
x1 <-matrix(1:8, nrow = 2)

```

2차원의 벡터이다.

동일 타입의 데이터만 저장 가능

rbind 행단위, cbind 열단위



# 배열(array)

3차원 벡터이다.

동일 타입의 데이터만 저장 가능



# 데이터 프레임(data.frame) : 2차원 구조

열단위로 서로 다른 타입의 데이터들로 구성 가능

**모든 열의 데이터 개수(행의 개수)는 동일해야 한다. **



# 리스트

저장 가능한 데이터 타입, 데이터 셋의 종류에 제한이 없다.

벡터 , 행렬, 배열
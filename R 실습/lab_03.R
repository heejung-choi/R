# [문제1] airquality 라는 데이터셋이 몇 개의 관측치를 가지고 있으면 어떠한 변수들을 가지고 있는지 채크하려 한다. 이 때 사용되는 R코드를 작성하시오
str(airquality);

# [문제2]  다음과 같이 값이 구성되는 데이터프레임을 정의하여 df1 에 저장한다.
x<- c(1,2,3,4,5)
y<- c(2,4,6,8,10)
df1 <- data.frame(x,y)
df1;

# [문제3] 다음과 같이 값이 구성되는 데이터프레임을 정의하여 df2 에 저장한다.
col1<- c(1,2,3,4,5)
col2<- c('a','b','c','d','e')
col3<- c(6,7,8,9,10)
df2 <- data.frame(col1,col2,col3);
df2;

# [문제4] c() 함수로 먼저 벡터를 생성한 다음 data.frame()사용해서 다음과 같이 구성되는 데이터 프레임 df3를 만들어 출력해 본다.(제품명이 팩터형이 되지 않게 한다.)
제품명<-c('사과', '딸기', '사과')
가격 <-c(1800,1500,3000)
판매량 <-c(24,38,13)
df3 <-data.frame(제품명,가격,판매량,stringsAsFactors = F);
df3
str(df3);

# [문제5] 앞에서 만든 데이터 프레임을 이용해서 과일 가격 평균, 판매량 평균을 구하여 출력한다.
#과일가격 평균
mean(df3[,2]);
#판매량 평균
mean(df3[,3]);

#[문제6] 다음 세 벡터를 이용하여 데이터프레임 df4를 생성하고, 
#name 변수는 문자, gender 변수는 팩터, math 변수는 숫자 데이터의 유형이라는 것을 확인하시오.
name <- c('Potter', 'Elsa', 'Gates', 'Wendy', 'Ben')
gender <- factor(c('M', 'F', 'M', 'F', 'M'))
math <- c(85, 76, 99, 88, 40)
df4<-data.frame(name,gender,math,stringsAsFactors = F)
df4
str(df4)

# 위에서 만든 데이터프레임에 대해 다음 작업을 수행하시오. 
# (a) stat 변수를 추가하시오. stat <- c(76, 73, 95, 82, 35)
df4$stat <-c(76, 73, 95, 82, 35);
df4
#(b) math 변수와 stat 변수의 합을 구하여 score 변수에 저장하시오. 
df4$score<-df4$math+df4$stat
df4
#(c) 논리 연산 인덱싱을 이용하여 score가 150 이상이면 A, 
#100 이상 150 미만이면 B, 70 이상 100 미만이면 C, 70 미만이면 D 등급을 부여하고 grade 변수에 저장하시오.
df4$grade<-ifelse(df4$score>=150,"A",ifelse(df4$score<150&df4$score>=100,"B",ifelse(df4$score<100&df4$score>=70,"C","D")))
df4

# [문제7] emp변수에 할당된 데이터프레임 객체의 구조를 점검한다.
str(emp)
#[문제8] emp 에서 3행, 4행 , 5행만 출력한다.
emp[3:5,]
#[문제9] emp 에서 ename컬럼만 출력한다.
emp[,'ename']
#[문제10] emp 에서 ename 과 sal컬럼만 출력한다.
emp[,c('ename','sal')]
#[문제11] 업무가 SALESMAN 인 사원의 이름, 월급, 직업을 출력한다.
emp
subset(emp,subset=emp$job=='SALESMAN')
#[문제12] 월급이 1000 이상이고 3000이하인 사원들의 이름, 월급, 부서번호를 출력한다.
subset(emp, select=c("ename","sal","deptno"), 
       subset= emp$sal>= 1000 &emp$sal< 3000)
#[문제13] emp 에서 직업이 ANALYST 가 아닌 사원들의 이름, 직업, 월급을 출력한다.
subset(emp, select=c("ename","job","sal"), 
       subset= emp$job!="ANALYST")
#[문제14] emp 에서 업무가 SALESMAN 이거나 ANALYST 인 사원들의 이름, 직업을 출력한다.
subset(emp, select=c("ename","ename","job"), 
       subset=(emp$job=="ANALYST"|emp$job=="SALESMAN"))
#[문제15] emp 에서 커미션이 정해지지 않은 직원의 이름과 월급 정보를 출력한다.
subset(emp,select=c("ename","sal"),subset=is.na(emp$comm))
#(NA 값을 채크하는 것은 제공된 교육자료의 1 페이지를 참고한다.)
#[문제16] 월급이 적은 순으로 모든 직원 정보를 출력한다.
emp[order(emp$sal),]

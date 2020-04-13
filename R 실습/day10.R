# 날짜와 시간 관련 기능을 지원하는 함수들

Sys.Date()
Sys.time()

# 어떤 객체 타입인지 보고싶다면 class 
# 구조를 확인하고 싶다면 str
class(Sys.Date()) #return 값 :"Date"
class(Sys.time()) #return 값: "POSIXct" "POSIXt" 
# ->1970 1 1 0시부터 시간을 계산하는  시간 객체이다.

# is. ~이냐? #as. DATE형으로 변환해줘~
as.Date("2020-04-15") 
as.Date("2020/04/15")
as.Date("2020,04,15")# -와 /는 지원하지만 , 는 지원하지 않는다.
# format 문자열을 지정하면 사용할 수 있다.
as.Date("15-04-2020")#자동으로 앞부터 년,월,일로 인식한다.

as.Date("2020,04,15", format="%Y,%m,%d")
as.Date("15-04-2020", format="%d-%m-%Y")
#소문자(m) 월 대문자(M) 분으로 인식

(today <- Sys.Date())#가로를 해줘서 출력까지 같이하게 해준다.
format(today, "%Y년 %m월 %d일%")
format(today, "%d일 %B %Y년") #대문자 B는 월을 풀네임으로
format(today, "%y")#두자리 연도만
format(today, "%Y")#네자리 연도
format(today, "%B")
format(today, "%a")# 축약형 요일
format(today, "%A")# 풀네임 요일
weekdays(today) 
months(today) 
quarters(today)
unclass(today)  # 1970-01-01을 기준으로 얼마나 날짜가 지났지는 지의 값을 가지고 있다.
Sys.Date()
Sys.time()
Sys.timezone()# Asia/Seoul

#월에서 두자리든 한자리든 상관하지 않는다.
as.Date('1/15/2018',format='%m/%d/%Y') # format 은 생략 가능
as.Date('1/15/18',format='%m/%d/%y')
as.Date('4월 26, 2018',format='%B %d, %Y')
as.Date('110228',format='%d%b%y') #NA b는 월이라는 것까지 나타내는 것이기 때문에 아래 2개와 같이 바꾸면 된다.
as.Date('112월28',format='%d%b%y')
as.Date('110228',format='%d%m%y')

Sys.setlocale("LC_TIME","English") #영어 기준으로 바꿔준다.
Sys.setlocale()#원상복구 다시 한국어 기준으로..


x1 <- "2019-01-10 13:30:41"
# 문자열을 날짜형으로
as.Date(x1, "%Y-%m-%d %H:%M:%S")#as.Date는 시분초를 무시한다.  
# 문자열을 날짜+시간형으로
strptime(x1, "%Y-%m-%d %H:%M:%S") # format 문자열 지정은 필수 / 이경우 연월일 시분초를 잘 나타내 준다.
strptime('2019-08-21 14:10:30', "%Y-%m-%d %H:%M:%S")

start <- as.Date("2020-01-01")
end <- as.Date("2021-01-01")
seq(start, end, 1) # 1일씩 증가
seq(start, end, "day") # 1일씩 증가
seq(start, end, "week") # 1주씩 증가
seq(start, end, "month") # 1달씩 증가
seq(start, end, "year") # 1년씩 증가
seq(start, end, "3 month") # 3달씩 증가
seq(start, end, length.out=7)


x2 <- "20200601"
as.Date(x2, "%Y%m%d")
datetime<-strptime(x2, "%Y%m%d")#datetime에 시간정보를 안 넣으면 시간정보를 빼고 나머지를 출력해준다.
str(datetime)

# Date 객체는 날짜만 나타낼 수 있으며 시간처리 불가
# 날짜와 시간을 함께 처리하려면 POSIXct 또는 POSIXlt 타입의 객체 사용

pct <- as.POSIXct("2020/04/15 11:30:20") # 표준 포맷인 경우 따로 포맷지정을 하지 않아도 된다.
plt <- as.POSIXlt("2020/04/15 11:30:20")
pct
plt
class(pct) #"POSIXct" "POSIXt" continuous time
class(plt) #"POSIXlt" "POSIXt" list time
as.integer(pct)
as.integer(plt)
unclass(plt)
plt$sec
plt$min
plt$hour
plt$mday 
plt$mon # 0 - 1월
plt$year # 1900을 뺀 값
plt$wday # 0-일요일 #수요일이므로 
# as.POSIXlt(): 시계열분석이나 년/월/일/시간/분/초 단위로 구분해서 연산을 해야 하는 경우 
#해당 함수로 날짜/시간 type으로 바꾸어주면 편하다.
t<-Sys.time()
ct<-as.POSIXct(t)
lt<-as.POSIXlt(t)
str(ct) 
str(lt) 
unclass(ct) 
unclass(lt) 
lt$mon+1
lt$hour
lt$year+1900
as.POSIXct(1449994438,origin="1970-01-01") #시간정보가 이렇게 초단위로 숫자로 되어있을수도 있다.
as.POSIXlt(1449994438,origin="1970-01-01")


#올해의 크리스마스 요일 2가지방법(요일명,숫자)
christmas2<-as.POSIXlt("2020-12-25")
weekdays(christmas2)
christmas2$wday #숫자로 나온다. weekdays만 할거면 weekdays만 해도 된다.
#2020년 1월 1일 어떤 요일
tmp<-as.POSIXct("2020-01-01")
weekdays(tmp)
#오늘은 xxxx년x월xx일x요일입니다 형식으로 출력
tmp<-Sys.Date()
format(tmp,'오늘은 %Y년 %B %d일 %A입니다')
year<-format(tmp,'%Y')
month<-format(tmp,'%m')
day<-format(tmp,'%d')
weekday<-format(tmp,'%A')
paste("오늘은 ",year,"년 ",month,"월 ",day,"일 ",weekday," 입니다.",sep="")

as.Date("2020/01/01 08:00:00") - as.Date("2020/01/01 05:00:00")
as.POSIXct("2020/01/01 08:00:00") - as.POSIXct("2020/01/01 05:00:00")
as.POSIXlt("2020/01/01 08:00:00") - as.POSIXlt("2020/01/01 05:00:00")


# 문자열 처리 관련 주요 함수들
x <- "We have a dream"
nchar(x) # 문자 자체의 길이
length(x) # 백터가 몇개로 데이터로 구성되어 있는지.

y <- c("We", "have", "a", "dream")
length(y)
nchar(y)

letters
sort(letters, decreasing=TRUE)

fox.says <- "It is only with the HEART that one can See Rightly"
tolower(fox.says) #소문자 로
toupper(fox.says) #대문자 로

substr("Data Analytics", start=1, stop=4)
substr("Data Analytics", 6, 14) #매개변수 생략 가능
substring("Data Analytics", 6) # 무조건 끝까지 뽑아냄

classname <- c("Data Analytics", "Data Mining", "Data Visualization")
substr(classname, 1, 4)

countries <- c("Korea, KR", "United States, US", "China, CN") # 마지막 두개의 단어만 뽑아내고 싶다면
substr(countries, nchar(countries)-1, nchar(countries))# 마지막 전글자에서 마지막 글자 까지
head(islands)# R 내장 객체 islands : 대륙별 크기 정보
landmesses <- names(islands)
landmesses
grep(pattern="New", x=landmesses) #grep함수는 index로 꺼내준다.

index <- grep("New", landmesses)
landmesses[index]
# 동일
grep("New", landmesses, value=T)#value=T로 하면 인덱스가 아니라 실제 값을 꺼내준다.
grep("New", landmesses, value=F)#인덱스값만 추출

txt <- "Data Analytics is useful. Data Analytics is also interesting."
sub(pattern="Data", replacement="Business", x=txt)#하나만 변경(최초)
gsub(pattern="Data", replacement="Business", x=txt)# 모두다 변경

x <- c("test1.csv", "test2.csv", "test3.csv", "test4.csv")
gsub(".csv", "", x)

words <- c("ct", "at", "bat", "chick", "chae", "cat", "cheanomeles", "chase", "chasse", "mychasse", "cheap", "check", "cheese", "hat", "mycat")

grep("che", words, value=T) #che 가 포함된 것
grep("at", words, value=T) #at이 포함된것
grep("[ch]", words, value=T) #c나 h가 포함된것 (대괄호 안에서는 문자 하나하나가 or)
grep("[at]", words, value=T) #a나 t가 포함된 것
grep("ch|at", words, value=T)#ch 또는 at이 포함된 것
grep("ch(e|i)ck", words, value=T) #check 또는 chick가 포함된 것
grep("chase", words, value=T) #chase
grep("chas?e", words, value=T) #chase #chas
grep("chas*e", words, value=T) #cha +e s가 0개 이상
grep("chas+e", words, value=T) #s가 1개 이상
grep("ch(a*|e*)se", words, value=T)# a 또는 e가 한개 이상
#[abc] : a또는 b또는 c또는
#[^abc]: 부정의 의미미
grep("^c", words, value=T)#여기서 ^는 시작하는
grep("t$", words, value=T)#여기서 t로 끝나는
grep("^c.*t$", words, value=T)#c로 시작해야 하고 t로 끝나고 중간에 문자는 상관없어

words2 <- c("12 Dec", "OK", "http//", 
            "<TITLE>Time?</TITLE>", 
            "12345", "Hi there")

grep("[[:alnum:]]", words2, value=TRUE)#문자와 숫자가 포함ㅁ된 것
grep("[[:alpha:]]", words2, value=TRUE)#문자가 포함된 것
grep("[[:digit:]]", words2, value=TRUE)#숫자가 포함된 것
grep("[[:punct:]]", words2, value=TRUE)#특수문자가 포함된 것
grep("[[:space:]]", words2, value=TRUE)#띄어쓰기가 포함된 것
grep("\\w", words2, value=TRUE)#문자 포함된 것
grep("\\d", words2, value=TRUE)#숫자 포함된 것
grep("\\s", words2, value=TRUE)#공백 포함된 것



fox.said <- "What is essential is invisible to the eye"
fox.said
strsplit(x= fox.said, split= " ")#여러가지 단어로 나누는데 블랭크를 기준으로 해라
str(strsplit(x= fox.said, split= " "))#List형
strsplit(x= fox.said, split="")#문자마다 분리리


fox.said.words <- unlist(strsplit(fox.said, " "))#백터로 변환
fox.said.words
fox.said.words <- strsplit(fox.said, " ")[[1]]#리스트 이기 때문에
fox.said.words
fox.said.words[3]#이미 겹대괄호 써서 꺼내왔기 때문에 이제 하나로만 꺼내도 된다.
p1 <- "You come at four in the afternoon, than at there I shall begin to the  happy"
p2 <- "One runs the risk of weeping a little, if one lets himself be tamed"
p3 <- "What makes the desert beautiful is that somewhere it hides a well"
littleprince <- c(p1, p2, p3) 
#여러 데이터 셋을 리턴하려면 list로 해야 한다. 그래서 list형으로 리턴하게 했다.
strsplit(littleprince, " ")
strsplit(littleprince, " ")[[3]] 
strsplit(littleprince, " ")[[3]][5]


# dplyr 패키지를 학습하자....

install.packages("dplyr") 
library(dplyr)
install.packages("ggplot2")
str(ggplot2::mpg) #road 하지 않아도 사용할 수 있다.
head(ggplot2::mpg)
mpg <- as.data.frame(ggplot2::mpg)
head(mpg)
exam <- read.csv("data/csv_exam.csv")
str(exam)
dim(exam)
head(exam);tail(exam)
View(exam)
# exam에서 class가 1인 경우만 추출하여 출력
exam %>% filter(class == 1) # [참고] 단축키 [Ctrl+Shit+M]으로 %>% 기호 입력
filter(exam,class==1)#과 동일
# 2반인 경우만 추출
exam %>% filter(class == 2) 
# 1반이 아닌 경우
exam %>% filter(class != 1)
# 3반이 아닌 경우
exam %>% filter(class != 3)
# 수학 점수가 50점을 초과한 경우
exam %>% filter(math > 50)
# 수학 점수가 50점 미만인 경우
exam %>% filter(math < 50)
# 영어점수가 80점 이상인 경우
exam %>% filter(english >= 80)
# 영어점수가 80점 이하인 경우
exam %>% filter(english <= 80)
# 1반 이면서 수학 점수가 50점 이상인 경우
exam %>% filter(class == 1 & math >= 50)
# 2반 이면서 영어점수가 80점 이상인 경우
exam %>% filter(class == 2 & english >= 80)
# 수학 점수가 90점 이상이거나 영어점수가 90점 이상인 경우
exam %>% filter(math >= 90 | english >= 90)
# 영어점수가 90점 미만이거나 과학점수가 50점 미만인 경우
exam %>% filter(english < 90 | science < 50)
# 목록에 해당되는 행 추출하기
exam %>% filter(class == 1 | class == 3 | class == 5) # 1, 3, 5 반에 해당되면 추출
# %in% 연산자 이용하기
exam %>% filter(class %in% c(1,3,5))  # 1, 3, 5 반에 해당하면 추출 클래스 변수의 값이 이 안에 해당되는 것과 같으면
# 추출한 행으로 데이터 만들기
(class1 <- exam %>% filter(class == 1))  # class가 1인 행 추출, class1에 할당
(class2 <- exam %>% filter(class == 2) ) # class가 2인 행 추출, class2에 할당
mean(class1$math)                      # 1반 수학 점수 평균 구하기
mean(class2$math)                      # 2반 수학 점수 평균 구하기

#chain 함수를 사용하게 되면 데이터 프레임의 명이 생략된다.
exam %>% select(math)  # math 추출
exam %>% select(english)  # english 추출
# 여러 변수 추출하기
exam %>% select(class, math, english)  # class, math, english 변수 추출
# 변수 제외하기
exam %>% select(-math)  # math 제외
exam %>% select(-math, -english)  # math, english 제외
# dplyr 함수 조합하기
# class가 1인 행만 추출한 다음 english 추출
exam %>% filter(class == 1) %>% select(english)
# ㄴ>from   ㄴ>where                 ㄴ>select 절과 동일 -> sql
# 가독성 있게 줄 바꾸기
exam %>%
  filter(class == 1) %>%  # class가 1인 행 추출
  select(english)         # english 추출
# 일부만 출력하기
exam %>%
  select(id, math) %>%  # id, math 추출
  head                  # 앞부분 6행까지 추출
# 일부만 출력하기
exam %>%
  select(id, math) %>%  # id, math 추출
  head(10)              # 앞부분 10행까지 추출

iris %>% pull(Species)
iris %>% select(Species)
iris %>% select_if(is.numeric)
iris %>% select(-Sepal.Length, -Petal.Length)

# Select column whose name starts with "Petal"
iris %>% select(starts_with("Petal"))

# Select column whose name ends with "Width"
iris %>% select(ends_with("Width"))

# Select columns whose names contains "etal"
iris %>% select(contains("etal"))

# Select columns whose name maches a regular expression
iris %>% select(matches(".t."))


# 오름차순으로 정렬하기
exam %>% arrange(math)  # math 오름차순 정렬
# 내림차순으로 정렬하기
exam %>% arrange(desc(math))  # math 내림차순 정렬
# 정렬 기준 변수 여러개 지정
exam %>% arrange(desc(class), desc(math))  # class 및 math 오름차순 정렬
exam %>% arrange(desc(math)) %>% head(1)

exam %>%
  mutate(total = math + english + science) %>%  # 총합 변수 추가
  head                                          # 일부 추출
#여러 파생변수 한 번에 추가하기
exam %>%
  mutate(total = math + english + science,          # 총합 변수 추가
         mean = (math + english + science)/3) %>%   # 총평균 변수 추가
  head     
exam %>%
  mutate(total = math + english + science,          # 총합 변수 추가
         mean = total/3) %>%   # 총평균 변수 추가
  head 

# 일부 추출
# mutate()에 ifelse() 적용하기
exam %>%
  mutate(test = ifelse(science >= 60, "pass", "fail")) %>%
  head
#추가한 변수를 dplyr 코드에 바로 활용하기
exam %>%
  mutate(total = math + english + science) %>%  # 총합 변수 추가
  arrange(total) %>%                            # 총합 변수 기준 정렬
  head                                          # 일부 추출


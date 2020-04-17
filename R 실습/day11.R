# 전체 요약하기

exam %>% summarise(n = n()) #summarise는 보통 group_by와 같이 사용하지만, 단독으로도 사용 가능(전체를 하나의 group으로 봄)
exam %>% tally() # 위의 코드(summarise)와 결과 동일. 축약된 summarise, 갯수 세는 것에 한해서만!(=count)

exam %>% summarise(mean_math = mean(math))  # math 평균 산출(데이터프레임 리턴)
mean(exam$math) #위의 코드와 다른 점은 return 유형이 다름 mean함수만 사용하면 벡터로 나타내줌

str(exam %>% summarise(mean_math = mean(math),
                       mean_english = mean(english),
                       mean_science = mean(science),) ) # 모든 과목의 평균 산출
#여러개를 한 번에 요약할 경우 summarise 사용. 요약하는게 하나만 필요할 경우에는 단일 함수만 사용

# 집단별로 요약하기
exam %>%
  group_by(class) %>% summarise(n = n()) #tibble은 데이터프레임형태와 비슷. tibble자체가 r의 기본구문은 아님
exam %>%
  group_by(class) %>% tally()   
exam %>% count(class)         # count() is a short-hand for group_by() + tally()
# add_tally() 와 add_count(..) 도 있음 -> 갯수 센 것을 새로운 열로 추가한다는 의미

exam %>%
  group_by(class) %>%                # class별로 분리
  summarise(mean_math = mean(math))  # math 평균 산출

exam %>%
  group_by(class) %>%                   # class별로 분리
  summarise(mean_math = mean(math),     # math 평균
            sum_math = sum(math),       # math 합계
            median_math = median(math), # math 중앙값
            n = n())                    # 학생 수

?mpg #ggplot2의 함수이기 때문에 로드하지 않으면, ?하나로는 안나옴. 
str(mpg)
# 각 집단별로 다시 집단 나누기
mpg %>%
  group_by(manufacturer, drv) %>%      # 회사별, 구방방식별 분리
  summarise(mean_cty = mean(cty)) %>%  # cty 평균 산출
  head(10)                             # 일부 출력

#[ 문제 ] 
#회사별로 "suv" 자동차의 도시 및 고속도로 통합 연비 평균을 구해 내림차순으로 정렬하고, 1~5위까지 출력하기
#절차	기능	dplyr 함수
#1	회사별로 분리	group_by()
#2	suv 추출	filter()
#3	통합 연비 변수 생성	mutate()
#4	통합 연비 평균 산출	summarise()
#5	내림차순 정렬	arrange()
#6	1~5위까지 출력	head()
library(ggplot2)
mpg <- as.data.frame(mpg)
str(mpg)
mpg %>%
  group_by(manufacturer) %>%           # 회사별로 분리
  filter(class == "suv") %>%           # suv 추출
  mutate(tot = (cty+hwy)/2) %>%        # 통합 연비 변수 생성
  summarise(mean_tot = mean(tot)) %>%  # 통합 연비 평균 산출
  arrange(desc(mean_tot)) %>%          # 내림차순 정렬
  head(5)                              # 1~5위까지 출력

mpg %>%
  filter(class == "suv") %>%           
  mutate(tot = (cty+hwy)/2) %>% 
  group_by(manufacturer) %>%           
  summarise(mean_tot = mean(tot)) %>%  
  arrange(desc(mean_tot)) %>%          # 내림차순 정렬
  head(5) 
#어떤 함수를 먼저 사용해도 상관없음. but, filter를 먼저 하는게 메모리를 덜 사용할 수 있음


# 가로로 합치기
# 중간고사 데이터 생성
test1 <- data.frame(id = c(1, 2, 3, 4, 5, 6),  
                    midterm = c(60, 80, 70, 90, 85, 100))
# 기말고사 데이터 생성
test2 <- data.frame(id = c(1, 5, 3, 4, 2, 7),  
                    final = c(70, 80, 65, 95, 83, 0))

# id 기준으로 합치기
total <- full_join(test1, test2, by = "id")  # id 기준으로 합쳐 total에 할당 #full outer join 과 같은 역할
#만약 여기서 inner join을 하게 되면 결측값이 있는 id가 날라간다.
#left 조인이라면 6번이 사라지고 right라면 7번이 사라진다.

# 다른 데이터 활용해 변수 추가하기
# 반별 담임교사 명단 생성
name <- data.frame(class = c(1, 2, 3, 4, 5), teacher = c("kim", "lee", "park", "choi", "jung"))

# class 기준 합치기
exam_new <- left_join(exam, name, by = "class") #그냥 조인해도 결과는 같다.

# 세로로 합치기
# 학생 1~5번 시험 데이터 생성
group_a <- data.frame(id = c(1, 2, 3, 4, 5),  test = c(60, 80, 70, 90, 85))
# 학생 6~10번 시험 데이터 생성
group_b <- data.frame(id = c(6, 7, 8, 9, 10),  test = c(70, 83, 65, 95, 80))
#세로로 합치기
group_all <- bind_rows(group_a, group_b)  # 데이터 합쳐서 group_all에 할당 #rbind 와 같음



# 데이터 정제 : 결측치(NA)와 이상치 처리

df <- data.frame(sex = c("M", "F", NA, "M", "F"), 
                 score = c(5, 4, 3, 4, NA))

# 결측치 확인하기
is.na(df)         # 결측치 확인
table(is.na(df))  # 결측치 빈도 출력
# 변수별로 결측치 확인하기
table(is.na(df$sex))    # sex 결측치 빈도 출력
table(is.na(df$score))  # score 결측치 빈도 출력
# 결측치 포함된 상태로 분석
mean(df$score)  # 평균 산출 #한개라도 NA가 있으면 NA가 나온다.
#이럴 경우 NA를 기본값으로 하고 하거나, 제거하고 하면 된다.
sum(df$score)   # 합계 산출 
# 결측치 있는 행 제거하기
library(dplyr) # dplyr 패키지 로드
df %>% filter(is.na(score))   # score가 NA인 데이터만 출력
df %>% filter(!is.na(score))  # score 결측치 제거
# 결측치 제외한 데이터로 분석하기
df_nomiss <- df %>% filter(!is.na(score))  # score 결측치 제거
mean(df_nomiss$score)                      # score 평균 산출
sum(df_nomiss$score)                       # score 합계 산출
# 여러 변수 동시에 결측치 없는 데이터 추출하기
# score, sex 결측치 제외
df_nomiss <- df %>% filter(!is.na(score) & !is.na(sex))
df_nomiss  
# 결측치가 하나라도 있으면 제거하기
df_nomiss2 <- na.omit(df)  # 모든 변수에 결측치 없는 데이터 추출
#결측치 제거해주는 함수 ( NA 제거)

#분석에 필요한 데이터까지 손실 될 가능성 유의
# 함수의 결측치 제외 기능 이용하기 - na.rm = T
mean(df$score, na.rm = T)  # 결측치( NA ) 제외하고 평균 산출
sum(df$score, na.rm = T)   # 결측치 제외하고 합계 산출
#summarise()에서 na.rm = T사용하기
# 결측치 생성
exam <- read.csv("data/csv_exam.csv")            # 데이터 불러오기
table(is.na(exam)) #FALSE만 100개 나온다.
exam[c(3, 8, 15), "math"] <- NA             # 3, 8, 15행의 math에 NA 할당
#평균 구하기
exam %>% summarise(mean_math = mean(math))             # 평균 산출
exam %>% summarise(mean_math = mean(math, na.rm = T))  # 결측치 제외하고 평균 산출
# 다른 함수들에 적용
exam %>% summarise(mean_math = mean(math, na.rm = T),      # 평균 산출
                   sum_math = sum(math, na.rm = T),        # 합계 산출
                   median_math = median(math, na.rm = T))  # 중앙값 산출
boxplot(exam$math)
mean<-mean(exam$math, na.rm = T)  # 결측치 제외하고 math 평균 산출
# 평균으로 대체하기
exam$math <- ifelse(is.na(exam$math), 55, exam$math)  # math가 NA면 55로 대체
exam$math <- ifelse(is.na(exam$math), mean, exam$math) 
table(is.na(exam$math))                               # 결측치 빈도표 생성
mean(exam$math)  # math 평균 산출

# 이상치 포함된 데이터 생성 - sex 3, score 6
outlier <- data.frame(sex = c(1, 2, 1, 3, 2, 1),  score = c(5, 4, 3, 4, 2, 6)) 
# 이상치 확인하기
table(outlier$sex)

table(outlier$score)

# 결측 처리하기 - sex
# sex가 3이면 NA 할당
outlier$sex <- ifelse(outlier$sex == 3, NA, outlier$sex)

#결측 처리하기 - score
# score가 1~5 아니면 NA 할당
outlier$score <- ifelse(outlier$score > 5, NA, outlier$score)

# 결측치 제외하고 분석
outlier %>%
  filter(!is.na(sex) & !is.na(score)) %>%
  group_by(sex) %>%
  summarise(mean_score = mean(score))

mpg <- as.data.frame(ggplot2::mpg) #여기서 tibble은 확장된 것이라고 생각하면 된다.
boxplot(mpg$hwy)
boxplot(mpg$hwy, range=2)
summary(mpg$hwy)
#상자그림 통계치 출력
boxplot(mpg$hwy)$stats  # 상자그림 통계치 출력
View(mpg)
# 결측 처리하기
# 12~37 벗어나면 NA 할당
mpg$hwy <- ifelse(mpg$hwy < 12 | mpg$hwy > 37, NA, mpg$hwy)
table(is.na(mpg$hwy))
# 결측치 제외하고 분석하기
mpg %>%
  group_by(drv) %>%
  summarise(mean_hwy = mean(hwy, na.rm = T))

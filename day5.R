# 교재 81페이지
library()
installed.packages
#insatall은 설치하는것이고, installed.packages 이것은 설치된것을 보여달라는 것이다.
#library는 비쥬얼하게, installed.packages는 콘솔창에 이미 설치되있는 패키지들을 보여준다.
search()
read_excel("book/data_ex.xls")
install.packages("readxl")
library(readxl) # require(readxl) reqdxl 로드하는것 이것을 해야지 로드가 된다.
excel_data_ex <- read_excel("book/data_ex.xls")#변수에 담기
getwd() #현재 접속해 있는 경로 확인 가능
View(excel_data_ex)
search()

#설치가 끝난것은 오른쪽 탭 packages에 들어가 있다. 거기서 확인할 수 있다.

# 웹 크롤링과 스크래핑

install.packages("rvest")  #rvest 설치해야 한다.
library(rvest)

url <- "http://unico2013.dothome.co.kr/crawling/tagstyle.html"
text <- read_html(url)
text
str(text) #리스트로 만들어진 객체라고 생각하면 된다.

nodes <- html_nodes(text, "div") #div 선택자 사용 
#태그를 찾는 이유: 컨텐츠를 찾아오기 위해 
nodes
title <- html_text(nodes)#세개의 div 컨텐트를 찾아서 백터로 리턴해준다.
title

node1 <- html_nodes(text, "div:nth-of-type(1)")
#css선택자 줄때 쉐도우 선택자도 줄 수 있다. 첫번째 div 꺼낼때 속성도 꺼내고 있다.
node1
html_text(node1)
html_attr(node1, "style")

node2 <- html_nodes(text, "div:nth-of-type(2)")
node2
html_text(node2)
html_attr(node2, "style")#style : NA 리턴된다.

node3 <- html_nodes(text, "div:nth-of-type(3)")
node3
html_text(node3)


# 단일 페이지(rvest 패키지 사용)
install.packages("rvest"); 
library(rvest)
text<- NULL
url<- "http://movie.naver.com/movie/point/af/list.nhn?page=1"
text <- read_html(url,  encoding="CP949")
text
# 영화제목
nodes <- html_nodes(text, ".movie")
title <- html_text(nodes)
title
# 영화평점
nodes <- html_nodes(text, ".title em")
point <- html_text(nodes)
point
# 영화리뷰 
nodes <- html_nodes(text, xpath="//*[@id='old_content']/table/tbody/tr/td[2]/text()")
imsi <- html_text(nodes, trim=TRUE) #dom객체 만들때 enter도 함께 들어간다.
review <- imsi[nchar(imsi) > 0]#문자열의 길이 nchar가 0보다 큰것만 뽑는다.
review
if(length(review) == 10) {
  page <- cbind(title, point)
  page <- cbind(page, review)
  write.csv(page, "movie_reviews.csv")
} else {
  cat("리뷰글이 생략된 데이터가 있네요ㅜㅜ\n")
}



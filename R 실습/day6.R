# 정규표현식 사용
word <- "JAVA javascript Aa 가나다 AAaAaA123 %^&*"
gsub(" ", "", word)#공백을 없애라
gsub(" ", "@", word)#공백은 골뱅이로 #gsub는 모두다
sub(" ", "@", word)#sub는 첫번째것만
gsub("A", "", word)#대문자 A만 없애라
gsub("a", "", word) #소문자 a만 없애라
gsub("Aa", "", word) #Aa 하나로 인식된다.
#여기까지는 정규표현식이라고 보기 어렵다. 이렇게 바꿔달라고 요구한것,
#아래부터 정규표현식
gsub("(Aa)", "", word)#()가로 한것과 그냥한 것과 결과값은 같지만, 그룹핑 하기 위해서 사용하는 것이다.
gsub("(Aa){2}", "", word)#두번 연달아 나온 것만 없애줘 라는 뜻
gsub("Aa{2}", "", word)#Aaa만 지워진다.
gsub("[Aa]", "", word)#대문자든, 소문자든 지워진다.
gsub("[가-힣]", "", word)#한글을 없애시오.
gsub("[^가-힣]", "", word)#한글만 남기고 나머지를 제거해라(^ NOT의 의미)
gsub("[&^%*]", "", word)
gsub("[[:punct:]]", "", word)#특수문자들 삭제 
gsub("[[:alnum:]]", "", word)#문자와 숫자(한글,영어,숫자 모두 지워짐)
gsub("[1234567890]", "", word)#숫자 제거
gsub("[0-9]", "", word) #숫자 제거
gsub("\\d", "", word) #숫자만 제거
gsub("\\D", "", word)#반대 -> 숫자가 아닌것들을 지우시오.
gsub("[[:digit:]]", "", word)#여기까지 모두 같은의미 숫자 제거
gsub("[^[:alnum:]]", "", word)#문자와 숫자만 남기시오
gsub("[[:space:]]", "", word)#tab, 띄어쓰기 제거

install.packages("RSelenium")
library(RSelenium)
remDr<-remoteDriver(remoteServerAddr= "localhost",port = 4445, browserName= "chrome")
remDr$open()

#google
remDr$navigate("http://www.google.com/")
#dom 객체를 가지고 와서 검색
webElem<-remDr$findElement(using = "css", "[name = 'q']")
#name이라는 속성이 있는데 q이다. using -> css :css선택자를 쓰겠다는 뜻
webElem$sendKeysToElement(list("JAVA", key = "enter"))
# sendkeys는 돔객체 하나만 찾아올 수 있다. 
# 여러개를 찾아오고 싶다면 반복문 사용해야 한다.

#naver
remDr<-remoteDriver(remoteServerAddr= "localhost",port = 4445, browserName= "chrome")
remDr$open()
remDr$navigate("http://www.naver.com/")
webElem<-remDr$findElement(using = "css", "[name = 'query']")
webElem$sendKeysToElement(list("JAVA", key = "enter"))
#dom 객체를 가지고 와서 검색


# [ 네이버 웹툰 댓글 읽기 ]
url<-'http://comic.naver.com/comment/comment.nhn?titleId=570503&no=135'
remDr$navigate(url) #위의 주소 navigate

#단수형으로 노드 추출 >베스트 링크라는 것은 하나기 때문에
more<-remDr$findElement(using='css','#cbox_module > div > div.u_cbox_sort > div.u_cbox_sort_option > div > ul > li:nth-child(2) > a')
more$getElementTagName()
more$getElementText()
more$clickElement()

#cbox_module > div > div.u_cbox_paginate > div > a:nth-child(4)
#cbox_module > div > div.u_cbox_paginate > div > a:nth-child(5)
#cbox_module > div > div.u_cbox_paginate > div > a:nth-child(12)

# 2페이지부터 10페이지까지 링크 클릭하여 페이지 이동하기 
#plus 연산자가 지원되지 않으니까 paste 함수 사용용
for (i in 4:12) {
  nextCss <- paste0("#cbox_module>div>div.u_cbox_paginate>div> a:nth-child(",i,") > span")
  nextPage<-remDr$findElement(using='css',nextCss)
  nextPage$clickElement()
  Sys.sleep(2)
}

#복수형으로 노드 추출 
url<-'http://comic.naver.com/comment/comment.nhn?titleId=570503&no=135'
remDr$navigate(url)
#베스트 댓글 내용 읽어오기
bestReviewNodes<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
sapply(bestReviewNodes,function(x){x$getElementText()})

#전체 댓글 링크 클릭후에 첫 페이지 내용 읽어오기
totalReview <- remDr$findElement(using='css','#cbox_module > div > div.u_cbox_sort > div.u_cbox_sort_option > div > ul > li:nth-child(2) > a')
totalReview$clickElement()
totalReviewNodes<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
sapply(totalReviewNodes,function(x){x$getElementText()})




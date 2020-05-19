url <- "http://unico2013.dothome.co.kr/crawling/exercise_bs.html"
text <- read_html(url)
text
str(text)

# <h1>태그의 컨텐츠
node1<- html_nodes(text,"h1")
node1
node1 <- html_text(node1)
# <a> 태그의 컨텐츠와 href 속성값
node2<-html_nodes(text,"a")
node2
href<-html_attr(node2,'href')
href

#img 태그의 src 속성값
node3<-html_nodes(text,"img")
node3
src<-html_attr(node3,'src')
src

#첫번째 h2 태그의 컨텐츠
node4<-html_nodes(text,"h2:nth-of-type(1)")
node4
node4 <- html_text(node4)

#<ul> 태그의 자식 태그들 중 style 속성의 값이 green으로 끝나는 태그의 컨텐츠
#[속성 $= 값]
#'속성'의 '값'이 지정핚 문자로 끝나는 속성에 대해서만 스타일을 적용
node5 <-html_nodes(text, "ul>*[style$='green']")
node5
node5 <- html_text(node5)
node5

#두번째 h2 태그의 컨텐츠
node6<-html_nodes(text,"h2:nth-of-type(2)")
node6
node6 <- html_text(node6)
node6

#<ul> 태그의 모든 자식 태그들의 컨텐츠 
node7 <-html_nodes(text,"ol>*")
node7
node7 <- html_text(node7)
node7
#children<-html_children(node7)


#<table> 태그의 모든 자손 태그들의 컨텐츠
node8 <-html_nodes(text,"table>*>*")
node8
node8 <- html_text(node8)
node8
#name이라는 클래스 속성을 갖는 <tr> 태그의 컨텐츠
node9 <-html_nodes(text,"tr.name")
node9
node9 <- html_text(node9)
node9
#target이라는 아이디 속성을 갖는 <td> 태그의 컨텐츠
node10 <-html_nodes(text,"td#target")
node10
node10 <- html_text(node10)
node10
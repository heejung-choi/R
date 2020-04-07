# 링크 클릭으로 AJAX 로 처리되는 네이버 웹툰 댓글 읽어 오기
repl_v = NULL;
library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open()
url<-'http://comic.naver.com/comment/comment.nhn?titleId=570503&no=135'
remDr$navigate(url)

#베스트 댓글 내용 읽어오기
doms1<-remDr$findElements(using ="css","ul.u_cbox_list span.u_cbox_contents")
vest_repl <- sapply(doms1,function(x){x$getElementText()})
repl_v <- c(repl_v, unlist(vest_repl))

toralReview <- remDr$findElement(using='css','span.u_cbox_in_view_comment') #객체 하나만 findElement
toralReview$clickElement()
#전체 댓글의 첫 페이지 내용 읽어오기
doms2<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
repl <-sapply(doms2,function(x){x$getElementText()})
repl_v <- c(repl_v, unlist(repl)) #unlist(리스트가 아님)

repeat {#무한루프
  for (i in 4:12) {               
    nextCss <- paste("#cbox_module>div>div.u_cbox_paginate>div> a:nth-child(",i,") > span", sep="")                
    try(nextListLink<-remDr$findElement(using='css',nextCss))
    if(length(nextListLink) == 0)   break;
    nextListLink$clickElement() #브라우저가 일할 시간을 주기 위해 잠시 대기상태
    Sys.sleep(1)
    #전체 댓글의 해당 페이지 내용 읽어오기
    doms3<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
    repl <-sapply(doms3,function(x){x$getElementText()})
    repl_v <- c(repl_v, unlist(repl))                
  }
  
  try(nextPage<-remDr$findElement(using='css',
                                  "#cbox_module > div > div.u_cbox_paginate > div > a:nth-child(13) > span.u_cbox_cnt_page"))
  #try 함수에 넣은 이유는 에러가 나더라도 무시해 라는 뜻
  
  if(length(nextPage) == 0)  break;
  nextPage$clickElement()
  Sys.sleep(1)
  doms2<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
  repl <-sapply(doms2,function(x){x$getElementText()})
  repl_v <- c(repl_v, unlist(repl))        
}
print(repl_v)
write(repl_v, "webtoon2.txt")


# [ 신라스테이 호텔에 대한 전체 페이지 댓글 읽기 ]
remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open()
url<-'https://www.agoda.com/ko-kr/shilla-stay-yeoksam/hotel/seoul-kr.html?asq=z91SVm7Yvc0eRE%2FTBXmZWCYGcVeTALbG%2FvMXOYFqqcm2JknkW25Du%2BVdjH%2FesXg8ORIaVs1PaEgwePlsVWfwf3sX%2BVNABRcMMOWSvzQ9BxqOPOsvzl8390%2BEhEylPvEiBp0eoREr2xLYHgqmk0Io4J1HYEzEOqyvdox%2BwS6yxHeonB9lh7mJsBIjSBPoMzBLFW01k%2BU8s2bGO6PcSdsu3T30HwabyNzwNYKiv%2BRDxfs%3D&hotel=699258&tick=637215342272&languageId=9&userId=bcb7ecc6-7719-465f-bf29-951e39733c66&sessionId=uouhnqjisace4freagmzbxxc&pageTypeId=7&origin=KR&locale=ko-KR&cid=-1&aid=130243&currencyCode=KRW&htmlLanguage=ko-kr&cultureInfoName=ko-KR&ckuid=bcb7ecc6-7719-465f-bf29-951e39733c66&prid=0&checkIn=2020-05-30&checkOut=2020-05-31&rooms=1&adults=1&childs=0&priceCur=KRW&los=1&textToSearch=%EC%8B%A0%EB%9D%BC%EC%8A%A4%ED%85%8C%EC%9D%B4%20%EC%97%AD%EC%82%BC%20(Shilla%20Stay%20Yeoksam)&productType=-1&travellerType=0&familyMode=off'
remDr$navigate(url)
Sys.sleep(3)
pageLink <- NULL
reple <- NULL
curr_PageOldNum <- 0
repeat{
  #클릭이벤트 발생시키는 태그 선택자
  doms <- remDr$findElements(using = "css selector", ".Review-comment-bodyText")
  #1초 느리게
  Sys.sleep(1)
  #sapply 는 list 대신 행렬 or 벡터로 반환한다.
  reple_v <- sapply(doms, function (x) {x$getElementText()})
  print(reple_v)
  reple <- append(reple, unlist(reple_v))
  #댓글 추출 개수 출력
  cat(length(reple), "\n")
  #컨텐츠 추출
  pageLink <- remDr$findElements(using='css',"#reviewSection > div:nth-child(6) > div > span:nth-child(3) > i ")
  #페이지
  #클릭오류가 발생해서 잘 클릭이 안된다면 "arguments[0].click();" 사용
  # "arguments[0].click();": 스크립트 실행문 작성
  # pageLink -> 아규먼트
  #클릭 이벤트를 자바스크립트로 나타낸 것
  #쓸대없이 웹페이지에 레이어를 깔았거나, div태그를 넣게 되면 이것이 된다.
  #이때 아규먼트가 list여야 한다. 그래서 findElements로 한것이다 -> 리스트로 추출하기 위해
  remDr$executeScript("arguments[0].click();",pageLink)
  Sys.sleep(2)
  curr_PageElem <- remDr$findElement(using='css','#reviewSection > div:nth-child(6) > div > span.Review-paginator-numbers > span.Review-paginator-number.Review-paginator-number--current')
  # as.numeric 숫자형 데이터로 변환
  curr_PageNewNum <- as.numeric(curr_PageElem$getElementText())
  #이전 페이지 : 현재 페이지
  cat(paste(curr_PageOldNum, ':', curr_PageNewNum,'\n'))
  # 이전페이지가 현재 페이지와 같아지면 더이상 페이지가 없다는 뜻이기 때문에 
  # 종료한다.
  if(curr_PageNewNum == curr_PageOldNum)  {
    cat("종료\n")
    break; 
  }
  curr_PageOldNum <- curr_PageNewNum;
}
cat(length(reple), "개의 댓글 추출\n")
write(reple,"hotel.txt")

# [ YES24의 명견만리 댓글 읽어오기 ]
#슬라이드를 내려야 리뷰글이 내려오게 된다.

library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost", port = 4445, browserName = "chrome")
remDr$open()
remDr$navigate("http://www.yes24.com/24/goods/40936880")

#프로그램 안에서 스크롤이 일어나게 한다.
#자바스크립트 언어로 스크롤이 일어나게 해야 한다.
#"scrollTo(0, 0)", args = list(webElem) 이부분이 자바스크립트 태그
webElem <- remDr$findElement("css", "body")
remDr$executeScript("scrollTo(0, 0)", args = list(webElem))
Sys.sleep(1)
remDr$executeScript("scrollBy(0, 3200)", args = list(webElem))
Sys.sleep(1)
remDr$executeScript("scrollBy(0, 3200)", args = list(webElem))
Sys.sleep(1)
remDr$executeScript("scrollBy(0, 3200)", args = list(webElem))
Sys.sleep(3)
repl_v = NULL
endFlag <- FALSE
page <- 3

repeat {
  for(index in 3:7) {
    fullContentLinkCSS <- paste("#infoset_reviewContentList > div:nth-child(",index,") > div.reviewInfoBot.crop > a", sep='')
    
    fullContentLink<-remDr$findElements(using='css selector',  fullContentLinkCSS)
    if (length(fullContentLink) == 0) {
      cat("종료\n")
      endFlag <- TRUE
      break
    }
    #더보기 찾아오는 것 
    remDr$executeScript("arguments[0].click();",fullContentLink);
    Sys.sleep(1)
    fullContentCSS <- paste("#infoset_reviewContentList > div:nth-child(",index,") > div.reviewInfoBot.origin > div.review_cont > p", sep='')
    fullContent<-remDr$findElements(using='css selector', fullContentCSS)
    print(fullContent)
    repl <-sapply(fullContent,function(x){x$getElementText()})    
    print(repl)
    repl_v <- c(repl_v, unlist(repl))
  }
  if(endFlag)
    break;  
  
  if(page == 10){
    page <- 3
    nextPageCSS <- "#infoset_reviewContentList > div.review_sort.sortTop > div.review_sortLft > div > a.bgYUI.next"
  }
  else{
    page <- page+1;
    nextPageCSS <- paste("#infoset_reviewContentList > div.review_sort.sortBot > div.review_sortLft > div > a:nth-child(",page,")",sep="")
  }
  #infoset_reviewContentList > div.review_sort.sortBot > div.review_sortLft > div > a:nth-child(4)
  #infoset_reviewContentList > div.review_sort.sortBot > div.review_sortLft > div > a:nth-child(5)
  remDr$executeScript("scrollTo(0, 0)", args = list(webElem))
  nextPageLink<-remDr$findElements(using='css selector',nextPageCSS) 
  remDr$executeScript("arguments[0].click();",nextPageLink);
  #sapply(nextPageLink,function(x){x$clickElement()})
  #이미지가 있는것을 했더니 오류가 났다. 그래서 자바스크립트 코드로 바꾸니 에러가 해결됬
  Sys.sleep(5)
  print(page)
}
write(repl_v, "yes24.txt")
#네이버 호텔 전체 댓글 읽기
remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open()
url<-'https://hotel.naver.com/hotels/item?hotelId=hotel:Shilla_Stay_Yeoksam&destination_kor=%EC%8B%A0%EB%9D%BC%EC%8A%A4%ED%85%8C%EC%9D%B4%20%EC%97%AD%EC%82%BC&rooms=2'
remDr$navigate(url)
Sys.sleep(3)
more<-0
reple <- NULL
doms<-0
pageend<-NULL
repeat{
  #클릭이벤트 발생시키는 태그 선택자
  doms <- remDr$findElements(using = "css selector", "body > div > div.ng-scope > div.container.ng-scope > div.content > div.hotel_used_review.ng-isolate-scope > div.review_ta.ng-scope > ul  div.review_desc > p")
  #1초 느리게
  Sys.sleep(1)
  #sapply 는 list 대신 행렬 or 벡터로 반환한다.
  reple_v <- sapply(doms, function (x) {x$getElementText()})
  print(reple_v)
  reple <- append(reple, unlist(reple_v))
  #댓글 추출 개수 출력
  cat(length(reple), "\n")
  if(!is.null(pageend))  {
    break; 
  }
  more<-remDr$findElement(using='css',"body > div > div.ng-scope > div.container.ng-scope > div.content > div.hotel_used_review.ng-isolate-scope > div.review_ta.ng-scope > div.paginate > a.direction.next")
  more$clickElement()
  print(more)
  try(pageend<-remDr$findElement(using='css','body > div > div.ng-scope > div.container.ng-scope > div.content > div.hotel_used_review.ng-isolate-scope > div.review_ta.ng-scope > div.paginate > a.direction.next.disabled'),silent=T)

}

write(reple,"naverhotel.txt")

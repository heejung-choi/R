# 단일 페이지(rvest 패키지 사용)
text<- NULL
url<-"https://movie.daum.net/moviedb/grade?movieId=131576"
text <- read_html(url)
text

# 영화평점
node1 <- html_nodes(text,"em.emph_grade")
point <- html_text(node1)
point

# test
# 자손 선택자를 지운 후 저장하면 가능 하다.
# node3<-html_nodes(text,"#mArticle > div.detail_movie.detail_rating div.raking_grade > em")

# 영화리뷰 
node2 <- html_nodes(text, "p.desc_review")
imsi <- html_text(node2, trim=TRUE) #dom객체 만들때 enter도 함께 들어간다.
#review <- imsi[nchar(imsi) > 0]#문자열의 길이 nchar가 0보다 큰것만 뽑는다.
review <-imsi

node5 <-html_nodes(text, "#mArticle > div.detail_movie.detail_rating > ul div > p")

if(length(review) == 10) {
  main <- cbind(point, review)
  write.csv(main, "daummovie1.csv")
} else {
  cat("리뷰글이 생략된 데이터가 있네요ㅜㅜ\n")
}
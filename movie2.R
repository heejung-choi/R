# 쥬디
site<-NULL
site<- "https://movie.daum.net/moviedb/grade?movieId=131576&type=netizen&page="
text <- NULL
movie.review <- NULL
for(i in 1: 5) {
  url <- paste(site, i, sep="")
  text <- read_html(url)
  nodes <- html_nodes(text, "em.emph_grade")
  point <- html_text(nodes)
  nodes <- html_nodes(text, "p.desc_review")
  review <- html_text(nodes, trim=TRUE)

  if(length(review) == 10) {
    page <- cbind(point, review)
    movie.review <- rbind(movie.review, page)
  } else {
    cat(paste(i," 페이지에는 리뷰글이 생략된 데이터가 있어서 수집하지 않습니다.ㅜㅜ\n"))
  }
}
write.csv(movie.review, "daummovie3.csv")

# 라라랜드
site<-NULL
site<- "https://movie.daum.net/moviedb/grade?movieId=95306&type=netizen&page="
text <- NULL
movie.review <- NULL
for(i in 1: 20) {
  url <- paste(site, i, sep="")
  text <- read_html(url)
  nodes <- html_nodes(text, "em.emph_grade")
  point <- html_text(nodes)
  nodes <- html_nodes(text, "p.desc_review")
  review <- html_text(nodes, trim=TRUE)
  if(length(review) == 10) {
    page <- cbind(point, review)
    movie.review <- rbind(movie.review, page)
  } else {
    cat(paste(i," 페이지에는 리뷰글이 생략된 데이터가 있어서 수집하지 않습니다.ㅜㅜ\n"))
  }
}
write.csv(movie.review, "daummovie2.csv")

site<-NULL
site<- "https://comic.naver.com/genre/bestChallenge.nhn?&page="
text <- NULL
movie.review <- NULL

for(i in 1: 20) {
  url <- paste(site, i, sep="")
  text <- read_html(url)
  node1 <- html_nodes(text, ".challengeTitle")
  comicName <- html_text(node1, trim=TRUE)
  node2 <- html_nodes(text, ".summary")
  comicSummary <- html_text(node2, trim=TRUE)
  node3 <- html_nodes(text, ".rating_type>strong")
  comicGrade <- html_text(node3)
  naver <- cbind(comicName, comicSummary)
  naver <- cbind(naver, comicGrade)
  write.csv(naver, "navercomic2.csv")
}





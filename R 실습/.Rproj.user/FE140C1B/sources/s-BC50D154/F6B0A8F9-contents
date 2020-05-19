url<- "https://comic.naver.com/genre/bestChallenge.nhn"
text <- read_html(url)
text
node1 <- html_nodes(text, ".challengeTitle")
comicName <- html_text(node1, trim=TRUE)
node2 <- html_nodes(text, ".summary")
comicSummary <- html_text(node2, trim=TRUE)
node3 <- html_nodes(text, ".rating_type>strong")
comicGrade <- html_text(node3)
naver <- cbind(comicName, comicSummary)
naver <- cbind(naver, comicGrade)
write.csv(naver, "navercomic.csv")




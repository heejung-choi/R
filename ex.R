site<-NULL
site<-"https://search.daum.net/search?w=news&q=%EA%B5%90%EC%9C%A1&DA=PGD&spacing=0&p="
text <- read_html(url)
node1 <- html_nodes(text, ".f_link_b")
newstitle <- html_text(node1)
node2 <- html_nodes(text, xpath="//*[@id='clusterResultUL']/li/div/div/p")
newspaper <- html_text(node2, trim=TRUE)
daum <- cbind(newstitle, newspaper)


site<-NULL
text<-NULL
site<-"https://search.daum.net/search?w=news&q=%EA%B5%90%EC%9C%A1&DA=PGD&spacing=0&p="
for(i in 1:20) {
  url <- paste(site, i, sep="")
  text <- read_html(url)
  node1 <- html_nodes(text, ".f_link_b")
  newstitle <- html_text(node1)
  node2 <- html_nodes(text, xpath="//*[@id='clusterResultUL']/li/div/div/p")
  newspaper <- html_text(node2, trim=TRUE)
  daum <- cbind(newstitle, newspaper)0
}
write.csv(daum, "ex4.csv")

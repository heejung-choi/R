library(rvest)
url<- "https://media.daum.net/ranking/popular/"
text <- read_html(url)
text
node1 <- html_nodes(text, "#mArticle > div.rank_news > ul.list_news2 div.cont_thumb > strong > a")
newstitle <- html_text(node1)
nodes <- html_nodes(text, "#mArticle > div.rank_news > ul.list_news2 div.cont_thumb > strong > span")
newspapername <- html_text(nodes, trim=TRUE)
daum <- cbind(newstitle[1:5], newspapername[1:5])
daumNews<- as.data.frame(daum)
names(daumNews)<-c("name","content")
daumNews

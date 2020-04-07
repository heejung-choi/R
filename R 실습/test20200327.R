url <- "http://media.daum.net/ranking/popular/?regDate="
newsall <- NULL

#현재 50개만 읽어옴 총 500개 읽어와야함
for(date in 20200301:20200310){
  
  site <- paste(url,date,sep="")
  text <- read_html(site)
  #뉴스 제목
  news.title <- html_nodes(text,'#mArticle > div > ul > li > div.cont_thumb > strong > a')
  title <- html_text(news.title)
  
  #신문사
  newspaper <- html_nodes(text,'span.info_news')
  site <- html_text(newspaper)
  
  news <- data.frame(newstitle=title, newspapername=site)
  newsall <- rbind(newsall,news)
}
write.csv(newsall,"20200327test1.csv")

#read.csv("daumnews.csv")

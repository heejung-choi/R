url<- "http://www.saramin.co.kr/zf_user/search?search_area=main&search_done=y&search_optional_item=n&searchType=default_mysearch&searchword=Java"
text <- read_html(url)
text

node1 <- html_nodes(text, ".lbl_sfilter>.txt")# tech_name 추출
tech_name <- html_text(node1, trim=TRUE)#tech_name 텍스트로 변환, 공백제거
tech_name<-gsub("[[:punct:]]", "",tech_name)# 특수문자 제거
tech_name<-tech_name[1:30] # 마지막행 :다른 필터항목 보기 제거

node2 <- html_nodes(text, ".lbl_sfilter>.count")# info_count 추출
info_count <- html_text(node2, trim=TRUE)# 텍스트로 변환, 공백제거
info_count <-gsub("[[:punct:]]", "",info_count)# 특수문자 제거


saramin<- cbind(tech_name, info_count)
write.csv(saramin, "saramin.csv")


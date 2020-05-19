url<-'http://comic.naver.com/comment/comment.nhn?titleId=570503&no=135'
remDr$navigate(url)
data.table<-NULL
#베스트 댓글
bestReNodes<-remDr$findElements(using="css selector","ul.u_cbox_list span.u_cbox_contents")
tr<-sapply(bestReNodes,function(x){x$getElementText()})
re<-unlist(tr)
data.table<-append(data.table,re)

#전체 댓글
totalReview <- remDr$findElement(using='css','#cbox_module > div > div.u_cbox_sort > div.u_cbox_sort_option > div > ul > li:nth-child(2) > a')
totalReview$clickElement()


#반복
#다음 a selector : #cbox_module > div > div.u_cbox_paginate > div > a:nth-child(13)
# 12 : #cbox_module > div > div.u_cbox_paginate > div > a:nth-child(4)
# 다음 : #cbox_module > div > div.u_cbox_paginate > div > a:nth-child(13)
# 클린봇의 댓글 부분 : #cbox_module > div > div.u_cbox_content_wrap > ul > li.u_cbox_comment.cbox_module__comment_384188676._user_id_no_ckceh > div.u_cbox_comment_box > div > div.u_cbox_text_wrap > span
#cbox_module > div > div.u_cbox_content_wrap > ul > li.u_cbox_comment.cbox_module__comment_385248138._user_id_no_bpFhR > div.u_cbox_comment_box > div > div.u_cbox_text_wrap
#cbox_module > div > div.u_cbox_content_wrap > ul > li.u_cbox_comment.cbox_module__comment_385248138._user_id_no_bpFhR > div.u_cbox_comment_box > div > div.u_cbox_text_wrap > span
for(j in 1:5){
  for (i in 4:13) {
    Sys.sleep(2)
    #전체 댓글 읽고 적용
    totalReviewNodes<-remDr$findElements(using ="css selector","ul.u_cbox_list div.u_cbox_text_wrap")
    tr<-sapply(totalReviewNodes,function(x){x$getElementText()})
    re<-unlist(tr)
    data.table<-append(data.table,re)
    #View(data.table)
    nextCss <- paste0("#cbox_module>div>div.u_cbox_paginate>div> a:nth-child(",i,") > span")
    nextPage<-remDr$findElement(using='css',nextCss)
    nextPage$clickElement()
    
    Sys.sleep(2)
  }
}
write.csv(data.table,"webtoon1.txt")

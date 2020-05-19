remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open()
url<-'https://www.istarbucks.co.kr/store/store_map.do?disp=locale'
remDr$navigate(url)
Sys.sleep(2)

#서울 클릭
seoul_click <- remDr$findElements(using='css',"#container > div > form > fieldset > div > section > article.find_store_cont > article > article:nth-child(4) > div.loca_step1 > div.loca_step1_cont > ul > li:nth-child(1) > a")
remDr$executeScript("arguments[0].click();",seoul_click)
Sys.sleep(2)

#전체 클릭
all_click <- remDr$findElements(using='css',"#mCSB_2_container > ul > li:nth-child(1) > a")
remDr$executeScript("arguments[0].click();",all_click)
Sys.sleep(2)

#서울 전체 검색결과 추출
sizeCss <-"#container > div > form > fieldset > div > section > article.find_store_cont > article > article:nth-child(4) > div.loca_step3 > div.result_num_wrap > span"
size<-remDr$findElements(using='css selector',sizeCss)
limit<-sapply(size,function(x){x$getElementText()})
#초기값 설정
index<-1
addr<-NULL
telephone<-NULL
shopname<-NULL
lat<-NULL
lng<-NULL
shopname<-NULL

repeat{
  #주소, 전화번호 추출
  addr_Telephone<-remDr$findElements(using ="css",paste("#mCSB_3_container > ul > li:nth-child(",index,") > p"))
  addr_Telephone2<- sapply(addr_Telephone,function(x){x$getElementText()})
  addr_Telephone<-unlist(strsplit(unlist(addr_Telephone2),split="\n"))
  addr_v<-addr_Telephone[1]
  telephone_v<-addr_Telephone[2]
  #주소 저장
  addr<-append(addr,addr_v)
  #전화번호 저장
  telephone<-append(telephone,telephone_v)
  print(addr)
  print(telephone)
  
  #나머지 부분 dom 객체 생성
  dom<-remDr$findElements(using ="css",paste("#mCSB_3_container > ul > li:nth-child(",index,")"))
  lat_v<-sapply(dom, function(x) { x$getElementAttribute("data-lat")})
  lat<-append(lat,lat_v)
  lng_v<-sapply(dom, function(x) { x$getElementAttribute("data-long")})
  lng<-append(lng,lng_v)
  shopname_v<-sapply(dom, function(x) { x$getElementAttribute("data-name")})
  shopname<-append(shopname,shopname_v)
  print(lat)
  print(lng)
  print(shopname)
  
# 3개의 매장 정보 단위로 스크롤 이벤트 발생
if(index %% 3==0 && index!=limit){
  remDr$executeScript(
    "var dom=document.querySelectorAll('#mCSB_3_container > ul > li')[arguments[0]];
    dom.scrollIntoView();",list(index))
}
else if(index==limit){
  break;
}
index<-index+1

}
finally<-NULL
finally<-cbind(shopname,lat,lng,addr,telephone)
print(finally)
write.csv(finally,"starbucks.csv")

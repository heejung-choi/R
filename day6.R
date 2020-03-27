# 정규표현식 사용
word <- "JAVA javascript Aa 가나다 AAaAaA123 %^&*"
gsub(" ", "", word)#공백을 없애라
gsub(" ", "@", word)#공백은 골뱅이로 #gsub는 모두다
sub(" ", "@", word)#sub는 첫번째것만
gsub("A", "", word)#대문자 A만 없애라
gsub("a", "", word) #소문자 a만 없애라
gsub("Aa", "", word) #Aa 하나로 인식된다.
#여기까지는 정규표현식이라고 보기 어렵다. 이렇게 바꿔달라고 요구한것,
#아래부터 정규표현식
gsub("(Aa)", "", word) 
gsub("(Aa){2}", "", word) 
gsub("[Aa]", "", word) 
gsub("[가-힣]", "", word) 
gsub("[^가-힣]", "", word) 
gsub("[&^%*]", "", word) 
gsub("[[:punct:]]", "", word) 
gsub("[[:alnum:]]", "", word) 
gsub("[1234567890]", "", word) 
gsub("[0-9]", "", word) 
gsub("\\d", "", word)
gsub("[[:digit:]]", "", word) 
gsub("[^[:alnum:]]", "", word) 
gsub("[[:space:]]", "", word) 
#문제1
exam1<- function(){
  
for(i in 1:length(letters)){
  alpha[i]<-paste(LETTERS[i],letters[i],sep="")
}
return(alpha)}
exam1()

#문제2
exam2<-function(x){
sum=0
for(i in 1:x){
  sum<-sum+i}
return(sum)}
exam2(3)

#문제3
exam3 <- function(x,y) {
if(x>y){
  data<-x-y
}else if(x<y){
  data<-y-x
}else{
  data<-0
}
return(data)
}
exam3(5,3)

#문제4
exam4 <-function(x,y,z){
if(y=='+'){
data<-x+z
}else if(y=='-'){
data<-x-z
}else if(y=='*'){
data<-x*z
}else if(y=='%/%'){
if(x==0){data<-"오류1"}
else if(z==0){data<-"오류2"}
else{data<-x%/%z}
}else if(y=='%%'){
  if(x==0){data<-"오류1"}
  else if(z==0){data<-"오류2"}
  else{data<-x%%z}
}else{
  data<-"규격의 연산자만 전달하세요"
}  
return(data)
}

exam4(1,2,4)
exam4(1,'+',4)
exam4(1,'%/%',0)


#문제5
exam5 <-function(x,y='#'){
i<-1
if(x<0){
}else{
while(i<=x){
i<-i+1
cat(y)  
}}
return()}
exam5(5)



#문제6
exam6<-function(x){
for(i in 1:length(x)){
if(is.na(x[i])){
    print('NA는 처리 불가')
}else{ 
if(x[i]>=85){  
print(paste(x[i],'점은 상등급 입니다.'))
}else if(x[i]>=70&x[i]<=84){
print(paste(x[i],'점은 중등급 입니다.'))
}else{
print(paste(x[i],'점은 하등급 입니다.'))  
}
}
}
return()}
exam6(c(100,5,NA))


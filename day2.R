# matrix 실습
x1 <-matrix(1:8, nrow = 2)
#matrix는 R이 내장하고 있는 것 
x1
# 행이 2개이기 때문에 2*4 matrix생성성
x1<-x1*3
x1
#각각의 원소마다 3을 곱함
sum(x1); min(x1);max(x1);mean(x1)
#벡터가 왔는지, 매트릭스가 왔는지 확인하기 위해서 typeof(x)로 확인!!!!
x2 <-matrix(1:8, nrow =3)
x2
#수가 맞지 않을 경우, 반복해서 채워줌
(chars <- letters[1:10])
# 대입문장을 가로로 묶어주게 되면 대입과 출력을 동시에 해준다.
# 가로로 묶으면 화면에도 바로 내보내주기 때문에 한 명령어로 원하는 두가지를 
#실행할 수 있다.

mat1 <-matrix(chars)
# chars로 매트릭스를 만들고 mat1에 담으시오.
# 매트릭스가 만들어질 때에는 최대한 열을 채우는데 행의 갯수가 없기 때문에
# 지금은 1열에만 데이터가 가득차 있는 것이다. 
mat1; dim(mat1)
#dim -> 몇행 몇열인지 알려준다.
#아래 내용은 변수에 담지 않았다-> 단순히 화면에 출력
# nrow: 행의 갯수 / ncol: 열의 갯수
matrix(chars, nrow=1)
matrix(chars, nrow=5)
matrix(chars, nrow=5, byrow=T)
matrix(chars, ncol=5)
matrix(chars, ncol=5, byrow=T)
matrix(chars, nrow=3, ncol=5)
matrix(chars, nrow=3)


vec1 <- c(1,2,3)
vec2 <- c(4,5,6)
vec3 <- c(7,8,9)
# rbind, cbind는 가변형
mat1 <- rbind(vec1,vec2,vec3); mat1
# rbind 행단위, cbind 열단위
# 행단위로 붙인 것은 행의 이름이 
# 행의 인덱스, 열의 인덱스를 하나의 대괄호 안에 구분해서 준다. 
# rbind 행마다 이름이 부여되었고, cbind 는 열마다 이름이 부여되었다.
mat2 <- cbind(vec1,vec2,vec3); mat2
mat1[1,1]
# 1행,1열을 꺼내줘
mat1[2,];mat1[,3]
#2행의 모든열 #3열의 모든 행
#이렇게 하는것이 벡터로 추출하는 것도 괜찮지만 매트릭스 형태를
#유지하고 싶다면 drop이라는 속성을 사용한다. -> drop=F 
mat1[1,1,drop=F]
mat1[2,,drop=F];mat1[,3,drop=F]
#행의 이름이나 열의 이름을 지우고 싶다면
rownames(mat1) <- NULL
colnames(mat2) <- NULL

mat1;mat2
# 행의 이름이나 열의 이름을 넣고 싶다면
#이름을 넣는다면 가독성을 높일 수 있다.
rownames(mat1) <- c("row1","row2","row3")
colnames(mat1) <- c("col1","col2","col3")
mat1
ls()
mean(x2)
sum(x2)
min(x2)
max(x2)
summary(x2)

mean(x2[2,])
sum(x2[2,])
rowSums(x2); colSums(x2)

apply(x2, 1, sum); apply(x2, 2, sum)  
?apply
apply(x2, 1, max)
apply(x2, 1, min)
apply(x2, 1, mean)

apply(x2, 2, max)
apply(x2, 2, min)
apply(x2, 2, mean)

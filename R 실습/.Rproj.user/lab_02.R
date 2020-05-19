# 문제 1
# 10에서 38사이 숫자 중에서 2씩 증가한 값으로 벡터 생성
v1<- seq(10,38,2);
v1;
# 3행 5열 매트릭스 생성, m1에 저장, 행우선 저장
m1<-matrix(v1, nrow=3, ncol=5, byrow=T);
m1;
# 각 원소 값들에 100을 더한 결과로 매트릭스 m2 생성
m2<-m1+100;
m2;
#최댓값 저장
m_max_v<-max(m1);
m_max_v;
# 최솟값 저장
m_min_v<-min(m1);
m_min_v;
#행단위의 최댓값
row_max<-apply(m1, 1, max);
row_max;
# 열단위의 최댓값;
col_max <-apply(m1, 2, max) ;
col_max;
m1; m2; m_max_v; m_min_v; row_max; col_max;

#문제 2
#1,2,3 의 벡터 n1, 4,5,6 의 벡터 n2,
#7,8,9 의 벡터 n3 를 이용하여 matrix를 생성
n1<- c(1,2,3)
n2<- c(4,5,6)
n3<- c(7,8,9)
m2 <- cbind(n1,n2,n3);
m2;

#문제 3
#1~9 의 벡터를 이용하여 matrix를 생성하고 출력한다.
v2<- seq(1,9,1);
v2;
m3<-matrix(v2, nrow=3, ncol=3, byrow=T);
m3;

#문제 4
rownames(m3) <- c("row1","row2","row3");
colnames(m3) <- c("col1","col2","col3");
m4<-m3;
m4;

#문제 5
(alpha <- letters[1:6]);
alpha;
alpha<-matrix(alpha, nrow=2, ncol=3);
alpha;
vec1 <- c('x','y','z');
vec1;
alpha2 <- rbind(alpha,vec1); alpha2;
vec2 <- c('s','p');
alpha3 <- cbind(alpha,vec2); alpha3;

#문제 6
a <- array(1:24, dim=c(2,3,4));
a;
#(1) 2행3열4층의 데이터를 출력한다
a[2,3,4];
#(2) 각 층마다 2행의 데이터를 출력한다. 
a[2,,];
#(3) 각 층마다 1열의 데이터를 출력한다.
a[,1,];
#(4) 3층의 모든 데이터를 출력한다.
a[,,3];
#(5) a라는 배열을 구성하는 모든 데이터에 100을 연산하여 출력한다.
a+100;
#(6) 4층의 모든 데이터들에 100을 곱한 결과를 출력한다.
a[,,4]*100;
#(7) 각층의 1행, 2열과3열만 출력한다.
a[1,2:3,];
#(8) 2층의 2행 데이터들의 값을 100을 더한 값으로 변경한다.
a[2,,2]<-a[2,,2]+100;
a;
#(9)) 1층의 모든 데이터들의 값에 2를 뺀 값으로 변경한다.
a[,,1]<-a[,,1]-2;
a;
#(10) a 배열의 모든 데이터 값들을 10을 곱한 값으로 변경한다.
a<-a*10;
a;
#(11)
rm(a);
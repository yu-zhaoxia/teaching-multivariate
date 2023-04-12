#random variables and random vectors

########################################
#random variables
#simulate a random variable from a normal distribution
x=rnorm(1,mean=0,sd=1)

#simulate a random sample from a normal distribution
n=100
x=rnorm(100, mean=0, sd=1)
#sample mean
mean(x)
#sample variance
var(x)

#calculate sample mean and variance using matrix algebra
#sample mean
rep(1,n)%*%x/n 
#sample variance
x^T %*% (diag(n) - (rep(1,n)%o%rep(1,n))/n ) %*% x / (n-1)


########################################
#random vectors
#the library "MASS" is required
library(MASS)

#simulate a random vector from a multivariate normal distribution
help(mvrnorm)
x=mvrnorm(1, mu=c(1,1,1), Sigma=diag(c(1,1,1)) )
#note: both diag(3) and diag(c(1,1,1)) give you the 3x3 identity matrix
my.cov=diag(3) + 0.5* rep(1,3)%o%rep(1,3)
eigen(my.cov)#to check whether the cov matrix is p.d.

#simulate a random sample of random vectors from a multivariate normal distribution
n=100
x=mvrnorm(n, mu=rep(1,3), Sigma=my.cov)
#sample mean
colMeans(x)
#sample variance
cov(x)
#sample correlation
cor(x)

#caluclate sample mean and var-cov using matrix algebra
#sample mean
rep(1,n)%*%x/n # a row vector
t(x) %*% rep(1,n)/n #a column vector
#sample variance-covarinace
sample.cov=t(x) %*% (diag(n) - (rep(1,n)%o%rep(1,n))/n ) %*% x / (n-1)
sample.cov
#sample corrlation
sample.cov/(sqrt(diag(sample.cov)) %o% sqrt(diag(sample.cov)) )

#there are many data sets in "MASS"
library(MASS)
data()
dim(iris)
plot(iris[1:4])
summary(iris)
colMeans(iris[,1:4])
cov(iris[,1:4])
cor(iris[,1:4])
det(cov(iris[,1:4]))









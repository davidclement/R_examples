# The purpose of this example is to compare the 
# definitional formula of standard deviation with
# the sample standard deviation formula (n vs (n-1) 
# in denominator). I still don't quite understand why
# n-1 makes it unbiased, but running this script shows
# that it has less bias than using n.

samples <- 1000
n <- 100

# matrix of standard normals
m <- matrix(rnorm(samples * n),samples,n)

samplemeans <- apply(m,1,mean)

# mdelta is the sample mean of each row of m
# subtracted from each cell of m in that row
# it's a matrix of x-xbar
mdelta <- matrix(rep(NA,samples*n),samples,n)
for (i in 1:samples) {
    mdelta[i,] <- m[i,] - samplemeans[i]
}

# use population sd calculation:
sd1 <- sqrt(apply(mdelta^2, 1, sum)/n)
# use sample sd calculation:
sd2 <- sqrt(apply(mdelta^2, 1, sum)/(n-1))

print(quantile(sd1))
print(quantile(sd2))

mfr <- par("mfrow")
par(mfrow=c(2,1))
hist(sd1,col="gray",breaks=25)
abline(v=quantile(sd1,c(0.5)),lwd=3)
hist(sd2,col="gray",breaks=25)
abline(v=quantile(sd2,c(0.5)),lwd=3)
par(mfrow=mfr)


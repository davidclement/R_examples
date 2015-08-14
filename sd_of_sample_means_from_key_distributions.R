# Simulate draws from distributions
# and calculate standard deviation 
# of sample means

#-------------------------------------------------------
# method for sampling distributions:
# 1. pull 10000 values (n * nsim) from a distribution
# 2. put them in a 1000 x 10 matrix:  matrix(sample, n)
# 3. call apply w/ MARGIN=1 & function=mean on each row
#     apply(matrixName, 1, mean)
#    returns a vector of means (one for each row)
# 4. call sd on the vector of means
#-------------------------------------------------------


# Standard normals have variance 1; means of $n$ standard normals
# have standard deviation $1/\sqrt{n}$
nsim <- 1000
n <- 10
sd(apply(matrix(rnorm(nsim * n), nsim), 1, mean))
1 / sqrt(n)


# Standard uniforms have variance $1/12$; means of 
# random samples of $n$ uniforms have sd $1/\sqrt{12 \times n}$
nsim <- 1000
n <- 10
sd(apply(matrix(runif(nsim * n), nsim), 1, mean))
1 / sqrt(12 * n)

# Poisson(4) have variance $4$; means of 
# random samples of $n$ Poisson(4) have sd $2/\sqrt{n}$
nsim <- 1000
n <- 10
sd(apply(matrix(rpois(nsim * n, 4), nsim), 1, mean))
2 / sqrt(n)


# Fair coin flips have variance $0.25$; means of 
# random samples of $n$ coin flips have sd $1 / (2 \sqrt{n})$
nsim <- 1000
n <- 10
sd(apply(matrix(sample(0 : 1, nsim * n, replace = TRUE),
                nsim), 1, mean))
1 / (2 * sqrt(n))

# This plots a standard normal probabiliy
# density function from the original formula

mynorm <- function(x) {
  1/(exp(1)^(x^2/2) * sqrt(2 * pi))
}

myx <- seq(-5,5,.01)
myy <- mynorm(myx)

plot(myy ~ myx,xlab="sd",ylab="P")


# prove that area under the curve is 1
a <- integrate(mynorm,-5,5)
print(paste("area under curve: ",round(a$value,3)))

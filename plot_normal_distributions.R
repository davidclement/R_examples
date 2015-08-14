library(ggplot2)
xvals <- seq(-10, 10, by = .01)
dat <- data.frame(
    y = c(
        dnorm(xvals, mean = 0, sd = 1),
        dnorm(xvals, mean = 0, sd = 2),
        dnorm(xvals, mean = 0, sd = 3),
        dnorm(xvals, mean = 0, sd = 4)
    ),
    x = rep(xvals, 4),
    sd = factor(rep(1 : 4, rep(length(xvals), 4)))
)
ggplot(dat, aes(x = x, y = y, color = sd)) + geom_line(size = 2) 
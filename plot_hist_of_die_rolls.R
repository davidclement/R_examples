library(ggplot2)
nsim <- 10000; 
dat <- data.frame(
  x = c(apply(matrix(sample(1 : 6, nsim * 10, replace = TRUE), 
                     nsim), 1, var),
        apply(matrix(sample(1 : 6, nsim * 20, replace = TRUE), 
                     nsim), 1, var),
        apply(matrix(sample(1 : 6, nsim * 100, replace = TRUE), 
                     nsim), 1, var)
        ),
  size = factor(rep(c(10, 20, 100), rep(nsim, 3))))
g <- ggplot(dat, aes(x = x, fill = size)) + geom_histogram(alpha = .20, binwidth=.3, colour = "black") 
g <- g + geom_vline(xintercept = 2.92, size = 2)
g + facet_grid(. ~ size)
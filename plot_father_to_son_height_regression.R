library(UsingR)
library(ggplot2)
data(father.son)

# from documentation:
# http://www.inside-r.org/packages/cran/UsingR/docs/father.son
# "Data set used by Pearson to investigate regression. 
# See data set galton for data set used by Galton.""



# plot_father_to_son_height_regression
hmin <- min(c(father.son$fheight,father.son$sheight))
hmax <- max(c(father.son$fheight,father.son$sheight))

p <- ggplot(father.son,aes(xmin=0,xmax=1,ymin=hmin,ymax=hmax)) +
     geom_segment(aes(x=0,xend=1,y=fheight,yend=sheight),alpha=0.1)

print(p)


# example scatter plot w/ linear model from above mentioned 
# documentation:

#data(father.son)
## like cover of Freedman, Pisani, and Purves
#plot(sheight ~ fheight, data=father.son,bty="l",pch=20)
#abline(a=0,b=1,lty=2,lwd=2)
#abline(lm(sheight ~ fheight, data=father.son),lty=1,lwd=2)
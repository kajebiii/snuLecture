#
#  Exercise.r
#
#  Created by KJBS2 on 04/15/2016.
#  Copyright (c) 2016 KJBS2. All rights reserved.
#


data = read.csv("/Users/kjb/Desktop/Exercise/20160415/ames.csv", header=T);
# 5.1
group = data$Gr.Liv.Area
mean = mean(group); mean;
var = var(group); var;
sigma = sd(group); sigma;

# 5.2
get = sample(group, 60)
mu = mean(get); mu

# 5.3
alpha = 0.05; 
u = mu - qnorm(alpha/2) * (sigma / sqrt(n)); u;
l = mu + qnorm(alpha/2) * (sigma / sqrt(n)); l;
if((l < mean) & (mean < u)) {print("In");
}else{print("Out");}


# 5.4
upper = c();
lower = c();
for(i in 1:100) {
    get = sample(group, 60)
    mu = mean(get)
    alpha = 0.05; 
    u = mu - qnorm(alpha/2) * (sigma / sqrt(60))
    l = mu + qnorm(alpha/2) * (sigma / sqrt(60))
    upper[i] = u; lower[i] = l;
}
upper;lower;
pop.mean = mean

plot_ci <- function(lo, hi, m) {
    par(mar=c(2, 1, 1, 1), mgp=c(2.7, 0.7, 0))
    k <- length(lo)
    ci.max <- max(rowSums(matrix(c(-1 * lo, hi), ncol=2)))
    xR <- m + ci.max * c(-1, 1)
    yR <- c(0, 41 * k / 40)
    plot(xR, yR, type='n', xlab='', ylab='', axes=FALSE)
    abline(v=m, lty=2, col='#00000088')
    axis(1, at=m, paste("mu = ", round(m, 4)), cex.axis=1.15)
    for(i in 1:k) {
        x <- mean(c(hi[i], lo[i]))
        ci <- c(lo[i], hi[i])
        if (lo[i]>m | m>hi[i]) {
            col <- "#F05133"
            points(x, i, cex=1.4, col=col)
            lines(ci, rep(i, 2), col=col, lwd=5)
        }
        col <- 1
        points(x, i, pch=20, cex=1.2, col=col)
        lines(ci, rep(i, 2), col=col)
    }
}
plot_ci(lower, upper, pop.mean) # 그래프 실행 코드
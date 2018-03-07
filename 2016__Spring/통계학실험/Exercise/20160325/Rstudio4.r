#
#  Rstudio4.r
#
#  Created by KJBS2 on 03/25/2016.
#  Copyright (c) 2016 KJBS2. All rights reserved.
#

# --------------------------------
dnorm(0, mean = 0, sd = 1)

x <- seq(from = -3, to = 3, by = 0.05)
y <- dnorm(x, mean = 0, sd = 1)
plot(x, y, type = "l", main = "standard normal deviate")
# --------------------------------
pnorm(-1, mean = 0, sd = 1)

pnorm(2500, mean = 2000, sd = 200)
1 - pnorm(1800, mean = 2000,  sd = 200)
pnorm(1800, mean = 2000, sd = 200, lower.tail = FALSE)

qnorm(0.98, mean = 100, sd = 15)
qnorm(0.02, mean = 100, sd = 15, lower.tail = FALSE)
# --------------------------------
dbinom(5, size = 10, prob = 0.5)

x <- 0:30
y <- dbinom(x, 30, 0.2)
plot(x, y, main = "biominal distribution", type = "h")
# --------------------------------
pbinom(5, 30, 0.2)

dbinom(3, 5, 0.1)
pbinom(5, 20, 0.1)
# --------------------------------
p <- 0.1
n <- c(10, 30, 50)

par(mfrow = c(1, 3))
for(i in 1:3) {
    x <- seq(from = 0, to = n[i], by = 1)
    fx <- dbinom(x, n[i], p)
    plot(x, fx, pch = 16, xlim = c(-3, 15), ylab = "probability", xlab = "", main = "bd -> snd")
    lines(x, fx)
    
    y <- seq(from = -5, to = 15, by = 0.1)
    mean <- n[i] * p
    sd <- sqrt(n[i] * p * (1-p) )
    fy <- dnorm(y, mean = mean, sd = sd)
    lines(y, fy, col="red")
}
# --------------------------------













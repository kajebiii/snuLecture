#
#  Rstudio4.r
#
#  Created by KJBS2 on 04/08/2016.
#  Copyright (c) 2016 KJBS2. All rights reserved.
#

# --------------------------------
n <- 10
x.mean <- c()
for (j in 1:200) {
    x <- runif(n, min = 0, max = 1)
    x.mean[j] <- mean(x)
}
hist(x.mean, xlim = c(0,1), probability = T, main = paste(" n =", n));
# --------------------------------
n <- c(10, 30, 50, 100)
par(mfrow = c(1,1))

for(i in 1:4) {
    x.mean <- c()
    for(j in 1:1000) {
        x <- runif(n[i], 0, 1)
        x.mean[j]<-mean(x)
    }
    hist(x.mean, xlim = c(0,1), probability=T, main = paste("n=", n[i]))
    
    y <- seq(0, 1, 0.01)
    mu <- 0.5
    sigma <- sqrt(1/12)
    fy <- dnorm(y, mu, sigma/sqrt(n[i]))
    lines(y, fy)
}

# --------------------------------
bodydims = read.csv("/Users/kjb/Desktop/Exercise/20160408/bodydims.csv", header=T);


bodydims.m <- bodydims[bodydims$sex == 1,]
bodydims.f <- bodydims[bodydims$sex == 0,]

# --------------------------------
par(mfrow = c(1,2))
hist(bodydims.f$bii.di)
qqnorm(bodydims.f$bii.di)
qqline(bodydims.f$bii.di, col=2134)
# --------------------------------
par(mfrow = c(1,2))
hist(bodydims.f$elb.di)
qqnorm(bodydims.f$elb.di)
qqline(bodydims.f$elb.di, col=2)
# --------------------------------
par(mfrow = c(1,2))
hist(bodydims.f$che.de)
qqnorm(bodydims.f$che.de)
qqline(bodydims.f$che.de, col=2)

k = c(0, 0, 0, 0, 0,0, 0, 0, 0, 0,0, 0, 0, 0, 0,0, 0, 0, 0, 0,0, 0, 0, 0, 0,0, 0, 0, 0, 0,0, 0, 0, 0, 0,0, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 3, 3, 4, 5,4, 5,4, 5,4, 5,4, 5,4, 5,4, 5,4, 5,4, 5,4, 5,4, 5,4, 5,4, 5)
par(mfrow = c(2,2))
hist(k)
qqnorm(k)
qqline(k, col=2)


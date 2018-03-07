#
#  Exercise.r
#
#  Created by KJBS2 on 04/08/2016.
#  Copyright (c) 2016 KJBS2. All rights reserved.
#


data = read.csv("/Users/kjb/Desktop/Exercise/20160408/ames.csv", header=T);

# 4.1
salePrice = data$SalePrice
hist(salePrice, probability = "T")
mean     =     mean(salePrice);     mean;
sd       =       sd(salePrice);       sd;
var      =      var(salePrice);      var;
median   =   median(salePrice);   median;
quantile = quantile(salePrice); quantile;

# 4.2
pick = sample(salePrice, 50)
mean(pick)

# 4.3
par(mfrow = c(1,1))
sample_mean50 = c()
for(i in 1:5000) {
    pick = sample(salePrice, 50)
    sample_mean50[i] <- mean(pick)
}
hist(sample_mean50, probability=T)
mean = mean(sample_mean50)
sd = sd(sample_mean50)

x <- seq(from = 100000, to = 300000, by = 1000)
y <- dnorm(x, mean = mean, sd = sd)
lines(x, y, col = "red")

# 4.4
mean(sample_mean50)
var(sample_mean50)

# 4.5
par(mfrow = c(1,1))
sample_mean150 = c()
for(i in 1:5000) {
    pick = sample(salePrice, 150)
    sample_mean150[i] <- mean(pick)
}
hist(sample_mean150, probability=T)

mean = mean(sample_mean150)
sd = sd(sample_mean150)

x <- seq(from = 100000, to = 300000, by = 1000)
y <- dnorm(x, mean = mean, sd = sd)
lines(x, y, col = "red")





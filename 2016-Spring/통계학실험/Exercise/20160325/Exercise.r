#
#  Exercise.r
#
#  Created by KJBS2 on 03/25/2016.
#  Copyright (c) 2016 KJBS2. All rights reserved.
#


data = read.csv("/Users/kjb/Desktop/Exercise/20160325/ames.csv", header=T);
salePrice = data$SalePrice
hist(salePrice, probability = "T")
mean     =     mean(salePrice);     mean;
sd       =       sd(salePrice);       sd;
var      =      var(salePrice);      var;
median   =   median(salePrice);   median;
quantile = quantile(salePrice); quantile;


x <- seq(from = 0, to = 900000, by = 1000)
y <- dnorm(x, mean = mean, sd = sd)
lines(x, y, col = "red")





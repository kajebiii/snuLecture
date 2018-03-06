#
#  Number2.r
#
#  Created by KJBS2 on 03/11/2016.
#  Copyright (c) 2016 KJBS2. All rights reserved.
#
install.packages("ggplot2")
library(ggplot2)

concentration <- c(6.7, 5.4, 5.2, 6.0, 8.7, 6.0, 6.4, 8.3, 5.3, 5.9,
                   7.6, 5.0, 6.9, 6.8, 4.9, 6.3, 5.0, 6.0, 7.2, 8.0,
                   8.1, 7.2,10.9, 9.2, 8.6, 6.2, 6.1, 6.5, 7.8, 6.2,
                   8.5, 6.4, 8.1, 2.1, 6.1, 6.5, 7.9,15.1, 9.5,10.6,
                   8.4, 8.3, 5.9, 6.0, 6.4, 3.9, 9.9, 7.6, 6.8, 8.6,
                   8.5,11.2, 7.0, 7.1, 6.0, 9.0,10.1, 8.0, 6.8, 7.3,
                   9.7, 9.3, 3.2, 6.4)
qplot(concentration, xlab = c(1.5, 15.5), bins = 7 )

hist(concentration, main = "")
test1 = concentration < 16.05
test2 = concentration > 14.05
sum(test1 & test2)

min(concentration)
max(concentration)
mean(concentration);median(concentration);quantile(concentration)
var(concentration);sd(concentration)

#-----------------------

score <- c(65, 70, 20, 50, 60, 25, 55, 40, 10, 73, 50,
           60, 20, 40, 35, 15, 25, 45, 60, 40, 30, 10,
           27, 55, 20, 78, 35, 90, 65, 40, 30, 35, 75,
           60, 70, 45, 30, 65, 80, 55, 25)
stem(score)
mean(score);median(score);quantile(score)
var(score);sd(score);mad(score);
table(cut(score, c(100, 65, 45, 25, 15, 0)))
pie(table(cut(score, c(100, 65, 45, 25, 15, 0))), labels = c('F','D','C','B','A'), radius = 1)
hist(score, xlim=c(0, 100))
barplot(table(cut(score, c(100, 65, 45, 25, 15, 0))), names.arg =c('F','D','C','B','A'))

#-----------------------

data <- c(153, 167, 228, 192, 118, 172, 143, 214, 184, 201,
          177, 080, 200, 207, 149, 172, 199, 108, 192, 156,
          064, 223, 157, 159, 130, 162, 098, 168, 120, 088,
          161, 179, 168, 157, 045, 155, 135, 118, 224, 122)
max(data) - min(data)
min(data)
table(cut(data, seq(40, 240, 20)))
hist(data, main="")
#dosu polygon??
#qplot(data, data = diamonds, geom = "freqpoly")

#-----------------------

x <- c(55, 92, 49, 97, 99, 58, 89, 96, 39, 80, 87, 74, 85, 97, 75, 68, 45, 63, 88)
y <- c(65, 70, 20, 50, 60, 25, 58, 40, 10, 73, 50, 60, 20, 35, 20, 40, 15, 25, 42)

#regressogram??
plot(x, y, xlim = c(30, 100))
qplot(x, y)
??with
mean(x);var(x);sd(x)
mean(y);var(y);sd(y)
cor(x, y)

#-----------------------

x <- c(-2, -1, 0, 1, 2)
y <- c(0, 2, 4, 2, 0)

plot(x, y)
mean(x);var(x);sd(x)
mean(y);var(y);sd(y)
cor(x, y)

#left and right is same

#----------------------------



#
#  Rstudio2.r
#
#  Created by KJBS2 on 03/11/2016.
#  Copyright (c) 2016 KJBS2. All rights reserved.
#

gender <- factor(c('M','M','M','M','M','M','M','M','F','F','F','F','F','F','F','F','F','F'))
score <- c(98,90,96,54,43,87,88,90,94,92,81,79,85,91,79,88,89,83)
hist(score, freq = F, breaks=10)
boxplot(score)
score2 <- c(11, 22, 33, 44, 55, 66, 77, 88, 99)
stem(score2)
table(gender)
summary(score);fivenum(score)
quantile(score)
#-----------------------
math <- c(66, 64, 48, 46, 78, 60, 90, 50, 66, 70)
phy  <- c(70, 68, 46, 48, 84, 64, 92, 52, 68, 72)

plot(math, phy, main="Hello World!", xlim=c(0, 100), ylim = c(0, 100), xlab = "hello", ylab = "I am Y", type = 'p')
cor(math, phy)



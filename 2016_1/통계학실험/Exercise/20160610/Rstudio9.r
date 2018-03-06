#
#  Rstudio8.r
#
#  Created by KJBS2 on 06/10/2016.
#  Copyright (c) 2016 KJBS2. All rights reserved.
#

#  9.1--------------------------------
num <- c(45, 59, 48, 46, 38, 47, 21, 12, 14, 17, 13, 17, 37, 32, 15, 25, 39, 41, 16, 11, 20, 21, 14, 7)
col <- factor(rep(1:4, rep(6, 4))) # -> factor (number -> string (?) )
col
bugs <- data.frame(num, col)
bugs 
fit <- lm(num ~ col, data = bugs)
anova(fit)
plot(fit)


#  9.2--------------------------------
A <- factor(rep(1:4, 3)); A;
B <- factor(rep(1:3, rep(4, 3))); B;
y <- c(64, 53, 47, 51, 49, 51, 45, 43, 50, 48, 50, 52)
cor <- data.frame(A, B, y)

fit2 <- lm(y ~ A + B, data=cor)
anova(fit2)

#  9.3--------------------------------
al <- read.table("/Users/kjb/Desktop/Exercise/20160610/alzheimer.txt", header=T);
al
interaction.plot(al$A, al$B, al$y)
fit3 <- lm(y ~ A * B, data = al)
anova(fit3)
summary(fit3)




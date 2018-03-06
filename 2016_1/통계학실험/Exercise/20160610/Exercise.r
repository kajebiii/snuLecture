#
#  Exercise.r
#
#  Created by KJBS2 on 06/10/2016.
#  Copyright (c) 2016 KJBS2. All rights reserved.
#

#  ex 1)--------------------------------
y <- c(16, 19, 25, 22, 21, 15, 16, 22, 21, 18, 13, 14, 15, 16, 15, 13, 19, 16, 20, 14, 11, 18, 18, 15, 14, 14, 10, 18, 15, 15, 11, 15, 11, 17, 17, 13, 14, 16, 13, 11)
A <- factor(rep(1:4, c(10, 11, 9, 10))); col
table <- data.frame(y, A); table
fit <- lm(y ~ A, data = table)
anova(fit)

#  ex 2)--------------------------------
A <- factor(rep(1:5, 3)); A
B <- factor(rep(1:3, rep(5, 3))); B
y <- c(210, 230, 190, 180, 190, 195, 170, 200, 190, 193, 295, 275, 290, 275, 265)
cor <- data.frame(A, B, y); cor
fit <- lm(y ~ A + B, data = cor);
anova(fit)

#  ex 3)--------------------------------
A <- factor(rep(rep(c("high", "low"), rep(5, 2)), 2)); A
B <- factor(rep(c("M", "F"), rep(2*5, 2))); B
y <- c(10, 7, 9, 6, 8, 5, 4, 7, 4, 5, 5, 4, 6, 3, 2, 3, 4, 5, 1, 2)
cor <- data.frame(A, B, y); cor
interaction.plot(cor$A, cor$B, cor$y)
fit <- lm(y ~ A * B, data = cor)
anova(fit)

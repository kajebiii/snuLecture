#
#  Rstudio1.r
#
#  Created by KJBS2 on 03/11/2016.
#  Copyright (c) 2016 KJBS2. All rights reserved.
#

#-----------------------
3+5;(3+5)^3;exp(-2)
#-----------------------
x <- 3+5;x;
x1 <- (3+5)^3;x1;
x.2 <- exp(-2);x.2;
#-----------------------
z <- "hello"; z;
#-----------------------
a1 <- c(1, 2, 3, 4)
a2 <- c(5, 6, 7, 8)
a3 <- c(9, 10, 11, 12)
b1 <- c('M', 'F', 'M', 'F')

cbind(a1, a2)
rbind(a1, b1)
#-----------------------
name <- c("KJBS2", "KJBS3", "KJBS4")
gender <- c("M", "F", "M");
math <- c(1, 2, 3)
eng <- c(4, 5, 6)

score <- cbind(name, gender, math, eng)
data.frame(name, gender, math, eng)
gender

View(score)
#-----------------------


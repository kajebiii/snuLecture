#
#  Rstudio67.r
#
#  Created by KJBS2 on 05/13/2016.
#  Copyright (c) 2016 KJBS2. All rights reserved.
#

#  6.1--------------------------------
#data <- read.table("/Users/kjb/Desktop/Exercise/20160513/score.txt", header=T);

score <- c(22, 25, 34, 35, 41, 41, 46, 46, 46, 47, 49, 54, 54, 59, 60);
t.test(score, mu = 40, alternative = "greater", conf.level = 0.95); #0.09852
t.test(score, mu = 40, alternative = "less"); #0.9015
t.test(score, mu = 40, alternative = "two.sided");

gram <- c(408, 405, 397, 405, 395, 415, 389, 403, 397, 390)
t.test(gram, mu = 400, alternative = "two.sided", conf.level = 0.95);


#  6.2--------------------------------
paired <- read.table("/Users/kjb/Desktop/Exercise/20160513/paired.txt", header=T);
t.test(paired$purple, paired$green, paired=T, alternative = "two.sided", conf.level = 0.95);

before = c(18, 21, 16, 22, 19, 24, 17, 21, 23, 18, 14, 16, 16, 19, 18, 20, 12, 22, 15, 17);
after  = c(22, 25, 17, 24, 16, 29, 20, 23, 19, 20, 15, 15, 18, 26, 18, 24, 18, 25, 19, 16);
mean(before)
mean(after)
t.test(before, after, paired=T, mu = -2, alternative = "two.sided", conf.level = 0.95);
#  6.3--------------------------------
#  6.4--------------------------------
paint <- read.table("/Users/kjb/Desktop/Exercise/20160513/paint.txt", header=T);
View(paint)
tapply(paint$time, paint$group, mean)
var.test(paint$time , paint$group)
var.test(time ~ group , data=paint) # -> same
t.test(time ~ group, var.equal=T, alternative="greater", data=paint)
t.test(time ~ group, var.equal=T, alternative="less", data=paint)
t.test(time ~ group, var.equal=T, alternative="two.sided", data=paint)

group = c( 1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2)
body  = c(22, 23, 25, 26, 27, 19, 22, 28, 33, 24, 21, 25, 36, 24, 33, 28, 29, 31, 30, 32, 33, 35)
a =     c(22, 23, 25, 26, 27, 19, 22, 28, 33, 24);
b = c(21, 25, 36, 24, 33, 28, 29, 31, 30, 32, 33, 35);
var.test(a, b, alternative="greater")
var.test(body ~ group) # -> same
t.test(body ~ group, var.equal=T, alternative="greater")


#  7.1--------------------------------
#  7.2--------------------------------
male   <- c(73, 98, 79)
female <- c(82, 58, 110)
prefer <- rbind(male, female); prefer;
chisq.test(prefer)

survey <- read.table("/Users/kjb/Desktop/Exercise/20160513/survey.txt", header=T);
find <- table(survey$Smoke, survey$Exer); find;
chisq.test(find)

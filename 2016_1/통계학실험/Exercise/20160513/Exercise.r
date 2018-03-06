#
#  Exercise.r
#
#  Created by KJBS2 on 05/13/2016.
#  Copyright (c) 2016 KJBS2. All rights reserved.
#


#  6.5--------------------------------
textbooks <- read.table("/Users/kjb/Desktop/Exercise/20160513/textbooks.txt", header=T);
mean(textbooks$amazNew);mean(textbooks$uclaNew)
t.test(textbooks$amazNew, textbooks$uclaNew, paired=T, alternative = "two.sided");

run10samp <- read.table("/Users/kjb/Desktop/Exercise/20160513/run10samp.txt", header=T);
tapply(run10samp$time, run10samp$gender, mean)
var.test(time ~ gender, data = run10samp) # -> same
t.test(time ~ gender, var.equal = T, alternative = "two.sided", data = run10samp)

#  7.3--------------------------------
male   <- c(288, 10, 61)
female <- c(378, 07, 62)
know <- cbind(male, female); know
chisq.test(know)

used <- c(11, 39)
unused <- c(14, 26)
patient <- rbind(used, unused); patient
chisq.test(patient)

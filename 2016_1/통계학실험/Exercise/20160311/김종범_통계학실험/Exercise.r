#
#  Exercise.r
#
#  Created by KJBS2 on 03/11/2016.
#  Copyright (c) 2016 KJBS2. All rights reserved.
#

data <- read.table("/Users/kjb/Desktop/Exercise/testinput.txt", header=T);
View(data)

View(table(data$genhlth))
mean(data$weight)
plot(data$weight, data$wtdesire, main = "Weight and WeightDesire", xlab = "Weight", ylab = "WeightDesire")
cor(data$weight, data$wtdesire)
wdiff = (data$weight - data$wtdesire)
hist(wdiff)
summary(wdiff)
sd(wdiff)
quantile(wdiff)

hist(data$age, breaks=50, main = "Age(breaks = 50)", xlab = "age")
hist(data$age, breaks=100, main = "Age(breaks = 100)", xlab = "age")

#
#  Exercise.r
#
#  Created by KJBS2 on 05/27/2016.
#  Copyright (c) 2016 KJBS2. All rights reserved.
#

#  8. ex 1--------------------------------
handspan <- read.table("/Users/kjb/Desktop/Exercise/20160527/ch08/handspan.txt", header=T);
View(handspan)
#  8. ex 1.1)--------------------------------
cor(handspan$HandSpan, handspan$Height)
par(mfrow = c(1, 1))
plot(handspan$Height ~ handspan$HandSpan)
#  8. ex 1.2)--------------------------------
cor.test(handspan$HandSpan, handspan$Height)
#  8. ex 1.3)--------------------------------
handspan.res <- lm(handspan$Height ~ handspan$HandSpan)
lm(handspan$Height ~ handspan$HandSpan)
summary(handspan.res)
#anova(handspan.res)
#  8. ex 1.4)--------------------------------
par(mfrow = c(2, 2))
plot(handspan.res)


#  8. ex 2--------------------------------
car <- read.table("/Users/kjb/Desktop/Exercise/20160527/ch08/carstopping.txt", header=T);
#  8. ex 2 1)--------------------------------
cor(car$Speed, car$StopDist)
cor.test(car$Speed, car$StopDist)
#  8. ex 2 2)--------------------------------
car.res <- lm(car$StopDist ~ car$Speed)
summary(car.res)
#  8. ex 2 3)--------------------------------
par(mfrow = c(2,2))
plot(car.res)
#  8. ex 2 4)--------------------------------
par(mfrow = c(1, 2))
plot(car$StopDist ~ car$Speed)
sqrt.dist = sqrt(car$StopDist)
plot(car$Speed, sqrt.dist)
#  8. ex 2 5)--------------------------------
car2.res <- lm(sqrt.dist ~ car$Speed)
summary(car2.res)
#  8. ex 2 6)--------------------------------
par(mfrow = c(2,2))
plot(car2.res)



#  8. ex 3--------------------------------
hospital <- read.table("/Users/kjb/Desktop/Exercise/20160527/ch08/hospital.txt", header=T);
View(hospital)
newData = as.data.frame(cbind(hospital$InfctRsk, hospital$Stay, hospital$Age, hospital$Xray))
colnames(newData) <- c("InfctRsk", "Stay", "Age", "Xray")
newData
#  8. ex 3 1)--------------------------------
par(mfrow = c(1,1))
plot(newData)
cor(newData)
cor.test(newData$InfctRsk, newData$Stay)
cor.test(newData$InfctRsk, newData$Age)
cor.test(newData$InfctRsk, newData$Xray)
#  8. ex 3 2)--------------------------------
hospital.res <- lm(InfctRsk ~ Stay + Age + Xray, data = newData)
summary(hospital.res)
#  8. ex 3 3)--------------------------------
par(mfrow = c(2, 2))
plot(hospital.res)











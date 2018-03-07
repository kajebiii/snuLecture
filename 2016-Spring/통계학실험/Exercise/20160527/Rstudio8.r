#
#  Rstudio8.r
#
#  Created by KJBS2 on 05/27/2016.
#  Copyright (c) 2016 KJBS2. All rights reserved.
#

#  8.1--------------------------------
possum <- read.table("/Users/kjb/Desktop/Exercise/20160527/ch08/possum.txt", header=T);
par(mfrow = c(1, 1))
plot(possum$totalL ~ possum$headL);
plot(possum$headL, possum$totalL)
cor(possum$headL, possum$totalL)
cor.test(possum$headL, possum$totalL, alternative="two.sided")
#  8.2--------------------------------
View(possum)
lm(possum$headL ~ possum$totalL)

possum.res <- lm(possum$headL ~ possum$totalL)
summary(possum.res)
anova(possum.res)
#  8.3--------------------------------
par(mfrow = c(2, 2))
plot(possum.res)
#  8.4--------------------------------
iqsize <- read.table("/Users/kjb/Desktop/Exercise/20160527/ch08/iqsize.txt", header=T);
View(iqsize)
plot(iqsize)
cor(iqsize)
cor.test(iqsize$PIQ, iqsize$Brain)
iqsize.res <- lm(PIQ ~ Brain + Height + Weight, data = iqsize)
summary(iqsize.res)
par(mfrow = c(2, 2))
plot(iqsize.res)


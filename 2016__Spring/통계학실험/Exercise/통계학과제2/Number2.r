#
#  Number2.r
#
#  Created by KJBS2 on 03/11/2016.
#  Copyright (c) 2016 KJBS2. All rights reserved.
#

X <- c(1, 2, 3, 4, 4, 5, 6, 6, 7, 8, 9, 9, 10, 10)
Y <- c(23, 29, 49, 64, 74, 87, 96, 97, 109, 119, 149, 145, 154, 166)
plot(X, Y)

sum(X)
sum(Y)
sum(X*Y)
mx = mean(X);mx;
my = mean(Y);my
length(X)
Sxy = 14*mean(X * Y) - 14 * mx * my
Sxx = 14*mean(X * X) - 14 * mx * mx
Syy = 14*mean(Y * Y) - 14 * my * my

Sxy;Sxx;Syy

ssr =Sxy^2 / Sxx
sse = Syy - ssr
sst = Syy
ssr;
sse/16
sst

ssr / (sse/16)
ssr /sst
sqrt(sse/16)


qf(0.99, 1, 16)

r = cor(X, Y)
sqrt(length(X) - 2) * r / sqrt(1 - r^2)
length(X) - 2
qt(0.99, 16)


XX <- c(97.6, 97.5, 99.0, 97.8, 100.7, 101.0, 98.5, 101.5, 98.6, 97.8)
YY <- c(97.4, 96.8, 94.1, 96.9, 99.5, 100.9, 98.2, 100.2, 98.5, 96.5)
XXX <- c(97.6, 97.5, 97.8, 100.7, 101.0, 98.5, 101.5, 98.6, 97.8)
YYY <- c(97.4, 96.8, 96.9, 99.5, 100.9, 98.2, 100.2, 98.5, 96.5)

plot(XX, YY)
plot(XXX, YYY)

mx = mean(XX);mx;
my = mean(YY);my

Sxy = 10*mean(XX * YY) - 10 * mx * my
Sxx = 10*mean(XX * XX) - 10 * mx * mx
Syy = 10*mean(YY * YY) - 10 * my * my
ssr =Sxy^2 / Sxx
sse = Syy - ssr
sst = Syy
Sxy/Sxx
my - Sxy/Sxx * mx


ssr/sse*8;
sst;
1-pf(ssr/sse*8, 1, 8)
ssr/sst

mx = mean(XXX);mx;
my = mean(YYY);my

Sxy = 9*mean(XXX * YYY) - 9 * mx * my
Sxx = 9*mean(XXX * XXX) - 9 * mx * mx
Syy = 9*mean(YYY * YYY) - 9 * my * my
ssr =Sxy^2 / Sxx
sse = Syy - ssr
sst = Syy
Sxy/Sxx
my - Sxy/Sxx * mx

1-pf(ssr/sse*7, 1, 7)
sst

ssr/sse*9;
sst;
1-pf(ssr/sse*8, 1, 8)
ssr/sst


Sxy
Sxx 

b = Sxy / Sxx;b

a = my - b * mx; a

sigma = sqrt((Syy - Sxy ^2 / Sxx)/7);sigma

xxxx = sigma / sqrt(Sxx);xxxx

b - qt(0.975, 7) * xxxx
b + qt(0.975, 7) * xxxx

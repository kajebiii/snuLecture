#
#  Rstudio5.r
#
#  Created by KJBS2 on 04/15/2016.
#  Copyright (c) 2016 KJBS2. All rights reserved.
#

# --------------------------------
dang = c(14.0, 14.2, 15.1, 13.7, 14.5, 15.6, 14.8, 15.1, 13.5, 15.8)
mn = mean(dang)
s2 = 0;
for(i in dang)
    s2 = s2 + (i - mn)^2;
s2 = s2 / (length(dang)-1);s2 
s = s2^0.5; s
# --------------------------------
alpha <- 0.05;n <- 50;mu <- 0;sigma <- 1;count = 0
for(i in 1:1000) {
    x <- rnorm(n, mu, sigma)
    qnorm(alpha/2)
    upper <- mean(x) - qnorm(alpha/2) * (sigma / sqrt(n))
    lower <- mean(x) + qnorm(alpha/2) * (sigma / sqrt(n))
    if( (lower < mu) & (mu < upper)) 
        count = count + 1
}
count/1000

# --------------------------------
# --------------------------------
# --------------------------------


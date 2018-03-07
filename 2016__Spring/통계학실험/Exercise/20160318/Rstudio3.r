#
#  Rstudio3.r
#
#  Created by KJBS2 on 03/18/2016.
#  Copyright (c) 2016 KJBS2. All rights reserved.
#

# --------------------------------
x <- c(1, 3, 5, 7)
y <- c(2, 4, 6)
z <- x + y; z;
# --------------------------------
x[1]
x2 <- x[2]; x2
x[c(1, 3, 4)];x[c(-2, -3)]
# --------------------------------
seq(1, 10, 1)
seq(1, 15, length = 10)
seq(from = 1, by = 2, length = 10)
# --------------------------------
3:10;10:3
rep(3, 5);rep(c(1, 2, 3), 2)
# --------------------------------
a1 <- c(1, 2, 3, 4)
a2 <- c(5, 6, 7, 8)
a3 <- c(9, 10, 11, 12)

mat1 <- rbind(a1, a2); mat1
mat2 <- rbind(mat1, a3); mat2
mat3 <- rbind(mat3, mat2); mat3
mat <- rbind(a1, a2, a3); mat

mat[1, 3]; mat[3, 2]
mat[2:1, 3]; mat[,3]
# --------------------------------
x <- -2.56
y <-  3.45
z <-  8

abs(x);sqrt(z)
round(x, 1);round(y, 1)
log(z);round(log(z), 3)

choose(5, 3);factorial(5)

paste("a", "b", "c")
paste("z =", z, " and log(z) =", round(log(z), digit=2))
# --------------------------------
x <- 7; y <- 2
x ^ y; x %% y; x %/% y;
x > y; x < y; (x %% y) == 1; (x %/% y) != 3;
# --------------------------------
for(i in 1:3) {
  x <- i + 1
  print(x)
}
for(j in 5:1) 
  print(j)
# --------------------------------
if(3 < 5) print("yes")
if(3 > 5) print("yes")
if(3 > 5) print("yes") else print("no")

for(i in 1:10)
  if(i %% 2 == 0)
    print(i)
# --------------------------------










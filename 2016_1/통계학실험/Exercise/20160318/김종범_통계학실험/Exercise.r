#
#  Exercise.r
#
#  Created by KJBS2 on 03/18/2016.
#  Copyright (c) 2016 KJBS2. All rights reserved.
#

set.seed(1)
# --------------------------------
data <- sample(1:100, 40); data;
mat <- matrix(data, 5, 8); mat;
one <- mat; one;
two <- mat[2:3,]; two;
three <- mat[,c(1,4,7,8)]; three;
mean(mat[,7]);var(mat[,7])
# --------------------------------
chooseNumber <- sample(1:20, 1)
if(chooseNumber >= 10) print("P") else print("NP")
# --------------------------------
chooseNumbers <- sample(1:20, 8)
for(number in chooseNumbers)
  if(number >= 10) print("P") else print("NP")
# --------------------------------

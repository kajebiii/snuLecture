###Chapter7###

#7.2
#ex1
male<-c(73,98,79)
female<-c(82,58,110)

x<-rbind(male, female)
x

chisq.test(x)

#ex2
survey<-read.table("C://Users//youjungjo//Desktop//survey.txt",header=T)
head(survey)

y<-table(survey$Smoke, survey$Exer)
y

chisq.test(y)

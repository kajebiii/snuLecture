#######Chapter6#######
#6.1
#ex1
score<-c( 22, 25, 34, 35, 41, 41, 46, 46, 46 ,47, 49, 54 ,54, 59, 60)
t.test(score, mu=40, alternative="greater")
t.test(score, mu=40, alternative="less")
t.test(score, mu=40, alternative="two.sided")

t.test(score, mu=40, alternative="greater", conf.level=0.9)

#ex2
can<-c( 408, 405, 397, 405, 395, 415, 389, 403, 397 ,390)
t.test(can, mu=400, alternative="two.sided")


#6.2
#ex1
paired<-read.table("/Users/youjungjo/Desktop/수업자료/통계학 실험/dataset/ch06/paired.txt", header=T)
t.test(paired$purple, paired$green, paired=T)

#ex2
before=c( 18, 21, 16, 22, 19, 24, 17, 21 ,23 ,18 , 14 ,16 ,16 ,19, 18 ,20, 12, 22 ,15 ,17)
after=c( 22, 25, 17, 24, 16, 29, 20, 23, 19, 20,  15, 15, 18, 26, 18, 24, 18, 25, 19, 16)
#exam=data.frame(cbind(before, after))

t.test(before, after, paired=T)   #X=before, Y=after



#6.4
#ex1
paint<-read.table("/Users/youjungjo/Desktop/수업자료/통계학 실험/dataset/ch06/paint.txt", header=T)

tapply(paint$time, paint$group, mean)

var.test(paint$time ~ paint$group)
var.test(time~group, data=paint)

 t.test(paint$time ~ paint$group, var.equal=T, alternative="greater")
 t.test(time ~ group, var.equal=T, alternative="greater", data=paint)


#ex2
group1<-c( 22, 23, 25, 26 ,27 ,19 ,22 ,28 ,33 ,24)
group2<-c( 21, 25, 36, 24, 33 ,28 ,29 ,31 ,30 ,32 ,33, 35)

var.test(group1, group2)
t.test(group1, group2, var.equal=T)

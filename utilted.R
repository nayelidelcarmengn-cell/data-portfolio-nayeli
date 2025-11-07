mj<-c(29,34,33,27,28.32,31,34,32,27)
shapiro.test(mj)

mv<-c(18,15,23,13,12)
shapiro.test(mv)

var.test(mj,mv)

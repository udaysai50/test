df<-read.csv("E:/ISMC6137/KoolKarmaSales.csv")
df
hist(df$SALES)
plot(df$SALES,df$ADVT)
library(lattice)
INCOME.HIGH<-(df$INCOME > 55)
xyplot(df$SALES~df$ADVT|INCOME.HIGH)
df1<-read.csv("E:/ISMC6137/Bankruptcy.csv")
df1
n<-length(df1$ROA)
n
s=sd(df1$ROA)
SE=s/sqrt(n)
moe=qnorm(0.975)*SE
xbar=mean(df1$ROA)
xbar+c(moe,-moe)
newdata <- subset(df1,df1$Status=='Solvent')
newdata
n1<-length(newdata$ROA)
n1
s1=sd(newdata$ROA)
SE1=s1/sqrt(n1)
moe=qnorm(0.975)*SE1
xbar1=mean(newdata$ROA)
xbar1+c(moe,-moe)
newdata1 <- subset(df1,df1$Status=='Bankrupt')
newdata1
n2<-length(newdata1$ROA)
n2
s2=sd(newdata1$ROA)
SE2=s2/sqrt(n2)
moe=qnorm(0.975)*SE2
xbar2=mean(newdata1$ROA)
xbar2+c(moe,-moe)
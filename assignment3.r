df<-read.csv("E:/ISMC6137/HousePrices.csv")
df
fit=lm(df$Price~df$SqFt+df$Bedrooms+df$Bathrooms+df$Brick+df$Neighborhood)
plot(df$Price,df$SqFt)
summary(fit)
abline(fit)
#Plots to examine the linear regression assumptions
par(mfrow=c(2,2))
plot(fit)
#Shapiro test is used to detect whether the residuals are normally distributed or not
#Ho:The residuals are normally distributed
shapiro.test(fit$res)
#Bartlett test is used to test for Homoscedasticity if errors are normally distributed
#H0:Homoscedasticity exists
bartlett.test(list(fit$residuals,fit$fitted.values))
#Plots are used to examine the Homoscedasticity
par(mfrow=c(1,1))
plot(fit$residuals~fit$fit)
#The following plot is used to test the linearity assumption
plot(df$Price,df$SqFt)
#Corelation(COR) and VIF(Variance inflation Factor) is used to test multi-collinearity
round(cor(df[1:4]),3)
library(car)
vif(fit)
#2nd Dataset
df1<-read.csv("E:/ISMC6137/Catalogs.csv")
df1
fit1=lm(df1$AmountSpent~df1$Catalogs+df1$Salary+df1$Gender+df1$Married+df1$Children+df1$Age+df1$Location+df1$History)
summary(fit1)
par(mfrow=c(2,2))
plot(fit1)
par(mfrow=c(1,1))
hist(fit1$res)
#Shapiro test is used to test for normality
shapiro.test((fit1$residuals))
#levene test is used to test for Homoscedasticity if errors are non normally distributed
#H0:Homoscedasticity exists
leveneTest(fit1$res,fit1$fit,center = mean)
#The following plot is used to test the linearity assumption
plot(df1$Salary,df1$AmountSpent)
#Test for multi-collinearity
dtemp <- cbind(df1[ ,6:7], df1[ ,9:10])
round(cor(dtemp), 3)
vif(fit1)
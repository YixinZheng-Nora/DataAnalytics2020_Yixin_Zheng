rm(list=ls())
setwd("/Users/zyx/Desktop/dataanalytics")

#Linear basis and least-squares constraints
library(dplyr)
multivariate <-read.csv("multivariate.csv")
head(multivariate)
attach(multivariate)
help(lm)
mm <- lm(Homeowners~Immigrant)
summary(mm)
mm
summary(mm)$coef  #Homeowners = 107494.898-6656.839*Immigrant
plot(Homeowners~Immigrant)
abline(mm)
abline(mm,col=2,lwd=3)
newlmmigrantdata <-data.frame(Immigrant=c(0,20))
mm %>% predict(newlmmigrantdata)
abline(mm)
abline(mm,col=3,lwd=3) # line color = green, line width = 3
attributes(mm)
mm$coefficients

#ggplot examples
plot(mtcars$wt,mtcars$mpg)
library(ggplot2)
qplot(mtcars$wt,mtcars$mpg)
qplot(wt,mpg,data = mtcars)
ggplot(mtcars,aes(x=wt,y=mpg))+geom_point()

plot(pressure$temperature,pressure$pressure)  #points
plot(pressure$temperature,pressure$pressure,type="l")  
points(pressure$temperature,pressure$pressure)

lines(pressure$temperature,pressure$pressure/2,col="red")
points(pressure$temperature,pressure$pressure/2,col="blue")
qplot(pressure$temperature,pressure$pressure,geom = "line")
qplot(temperature,pressure,data=pressure,geom = "line")
ggplot(pressure,aes(x=temperature,y=pressure))+geom_line()+geom_point()

#creating bar graphs
barplot(BOD$demand,names.arg = BOD$Time)
table(mtcars$cyl)
barplot(table(mtcars$cyl))
qplot(mtcars$cyl)           #cyl -> continuous
qplot(factor(mtcars$cyl))   #cyl -> discrete
ggplot(mtcars,aes(x=factor(cyl)))+geom_bar()

#creating histogram
hist(mtcars$mpg)
hist(mtcars$mpg,breaks=10)
hist(mtcars$mpg,breaks=5)
hist(mtcars$mpg,breaks=12)
qplot(mpg,data = mtcars,binwidth=4)
ggplot(mtcars,aes(x=mpg))+geom_histogram(binwidth=5)

#creating box-plot
plot(ToothGrowth$supp, ToothGrowth$len)
boxplot(len~supp,data=ToothGrowth)
boxplot(len~supp+dose,data=ToothGrowth)
qplot(ToothGrowth$supp, ToothGrowth$len,geom="boxplot")
qplot(supp,len,data=ToothGrowth,geom="boxplot")
ggplot(ToothGrowth,aes(x=supp,y=len))+geom_boxplot()
qplot(interaction(ToothGrowth$supp, ToothGrowth$dose),ToothGrowth$len,geom="boxplot")
qplot(interaction(supp,dose),len,data=ToothGrowth,geom="boxplot")
ggplot(ToothGrowth,aes(x=interaction(supp,dose),y=len))+geom_boxplot()

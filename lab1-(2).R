rm(list=ls())
setwd("/Users/zyx/Desktop/dataanalytics")

help(data)
data()

EPI_data <- read.csv("/Users/zyx/Downloads/2010EPI_data.csv",header = TRUE, row.names = 1)
View(EPI_data)
attach(EPI_data)
#install.packages("XQuartz")
#fix(EPI_data)
#help("fix")
EPI
tf <- is.na(EPI)
E <- EPI[!tf]

summary(EPI) #stats
fivenum(EPI, na.rm = TRUE)
stem(EPI) #stem and leaf plot
hist(EPI)
hist(EPI, seq(30.,95.,1.0),probability = TRUE)
lines(density(EPI,na.rm = TRUE,bw=1.))
lines(density(EPI,na.rm = TRUE,bw="SJ"))
rug(EPI)                                  #exploring the distribution
plot(ecdf(EPI), do.points=FALSE, verticals=TRUE)
par(pty='s')
qqnorm(EPI)
qqline(EPI)
x <- seq(30,95,1)
qqplot(qt(ppoints(250),df=5),x,xlab = "Q-Q plot for t dsn")
qqline(x)                               #fitting a distribution beyond histograms

#exercise1 - DALY
EPI_data[0,]
DALY
NullD <- is.na(DALY)
E <- DALY[NullD]
E
summary(DALY)
fivenum(DALY)
stem(DALY)
hist(DALY)
hist(DALY, seq(0.,92.,2.0),probability = TRUE)
lines(density(DALY,na.rm = TRUE,bw=2.))
lines(density(DALY,na.rm = TRUE,bw="SJ"))
rug(DALY)
plot(ecdf(DALY),do.points=FALSE,verticals = TRUE)
par(pty='s')
qqnorm(DALY)
qqline(DALY)

#exercise1 - Water_E
EPI_data[0,]
WATER_E
NullW <- is.na(WATER_E)
E <- WATER_E[NullW]
E
summary(WATER_E)
hist(WATER_E)
hist(WATER_E,seq(0,100,2),probability = TRUE)
lines(density(DALY,na.rm = TRUE,bw=2.))
lines(density(DALY,na.rm = TRUE,bw="SJ"))
rug(WATER_E)
plot(ecdf(WATER_E),do.points=FALSE,verticals = TRUE)
qqnorm(WATER_E)
qqline(WATER_E)

boxplot(EPI,DALY)                  #Comparing distribution
qqplot(EPI,DALY)

help(distributions)
#exercise2 - filtering
EPILand <- EPI[!Landlock]          #Conditional filtering
ELand <- EPILand[!is.na(EPILand)]
hist(ELand)
hist(ELand, seq(30.,95.,1.0),prob=TRUE)

#exercise - other dataset: GPW3_GRUMP
GPW <- read.csv("GPW3_GRUMP_SummaryInformation_2010.csv",header = TRUE)
View(GPW)
summary(GPW)
#exercise - other dataset: water_treatment
water <- read.csv("water-treatment.csv")
View(water)
summary(water)
water$PH.E
tf <- is.na(water$PH.E)
E <- water$PH.E[tf]
E
summary(water$PH.E) #stats
fivenum(water$PH.E, na.rm = TRUE)
hist(water$PH.E)
hist(water$PH.E, seq(6,9.,0.1),probability = TRUE)
lines(density(water$PH.E,na.rm = TRUE,bw=0.1))
#lines(density(water$PH.E,na.rm = TRUE,bw="SJ"))
rug(water$PH.E)                                 
plot(ecdf(water$PH.E), do.points=FALSE, verticals=TRUE)
par(pty='s')
qqnorm(water$PH.E)
qqline(water$PH.E)

rm(list=ls())
setwd("/Users/zyx/Desktop/dataanalytics")

help("data.frame")
days <- c('Mon','Tue','Wed','Thur','Fri','Sat','Sun')
temp <- c(28,30.5,32,31.2,29.3,27.9,26.4)
snowed <- c('T','T','F','F','T','T','F')
RPI_Weather_Week <- data.frame(days,temp,snowed)       #set dataframe

RPI_Weather_Week
head(RPI_Weather_Week)
str(RPI_Weather_Week)
summary(RPI_Weather_Week)        #get basic overview of the dataframe

RPI_Weather_Week[1,]
RPI_Weather_Week[,1]
RPI_Weather_Week[,'snowed']
RPI_Weather_Week[,'days']
RPI_Weather_Week[1:5,c("days","temp")]
RPI_Weather_Week$temp
a = subset(RPI_Weather_Week,subset=snowed=='T')
help("subset")
subset(RPI_Weather_Week,subset=snowed=='F')   #dataframe reading & slice

sorted.snowed <- order(RPI_Weather_Week['snowed'])
sorted.snowed
RPI_Weather_Week[sorted.snowed,]                  #!!!!sorted!!!
dec.snow <- order(-RPI_Weather_Week$temp) #DESC sorted 
dec.snow

empty.DataFram <- data.frame()    #Creating an EMPTY dataframe
v1 <- 1:10 #1~10
letters #36 letters
v2 <-letters[1:10]
df <- data.frame(col.name.1 = v1,col.name.2 = v2)
df

write.csv(df,file = 'saved_df1.csv')
df2 <- read.csv('saved_Df1.csv')      #importing data and exporting data
df2
df3 <- read.csv("saved_df1.csv", header = FALSE)
df3
help("read.csv")

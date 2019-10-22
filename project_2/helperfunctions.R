library(tidyr)
library(ggplot2)
library(dplyr)
library(tidyverse)
library(magrittr)
library(lubridate)
library(ggplot2)
dataset <- read.table("C:\\Users\\Helal\\Desktop\\shiny\\UMD_Services_Provided_20190719.tsv.txt", fill=TRUE, header=FALSE)
dates = dataset %>% 
  separate(V1, into=c("Month", "Day", "Year")) 

fooddata <- dates[,c(1,3,6,7)]
fooddata <- fooddata[-1,]
fooddata$Month <- as.numeric(fooddata$Month)
fooddatabymonth <- fooddata[order(fooddata$Month),]
fooddatabyyear <- fooddata[order(fooddata$Year),]
fooddata2018 <- subset(fooddatabymonth, fooddatabymonth[2]==2018)
fooddata2017 <- subset(fooddatabymonth, fooddatabymonth[2]==2017)
fooddata2016 <- subset(fooddatabymonth, fooddatabymonth[2]==2016)
fooddata2015 <- subset(fooddatabymonth, fooddatabymonth[2]==2015)
fooddata2014 <- subset(fooddatabymonth, fooddatabymonth[2]==2014)
fooddata2013 <- subset(fooddatabymonth, fooddatabymonth[2]==2013)
fooddata2012 <- subset(fooddatabymonth, fooddatabymonth[2]==2012)
fooddata2011 <- subset(fooddatabymonth, fooddatabymonth[2]==2011)
fooddata2010 <- subset(fooddatabymonth, fooddatabymonth[2]==2010)
fooddata2009 <- subset(fooddatabymonth, fooddatabymonth[2]==2009)
fooddata2008 <- subset(fooddatabymonth, fooddatabymonth[2]==2008)
```

### We create tables of the total food pounds per month for every year from 2008 - 2018


total2018 <- matrix(nrow=12, ncol=2)
total2018[,1] <- c(01,02,03,04,05,06,07,08,09,10,11,12)
for (i in 1:12){
  monthsub <- subset(fooddata2018, fooddata2018[,1]==i)
  monthsub$V5 <- as.numeric(monthsub$V5)
  monthsub <- sum(monthsub[,4])
  total2018[i,2] <- monthsub
}
total2018 <- data.frame(total2018)
sum2018 <- sum(total2018[,2])
##### analysis for year 2017 by month ####
total2017 <- matrix(nrow=12, ncol=2)
total2017[,1] <- c("January","February","March","April","May","June","July","August","September","October","November","December")
for (i in 1:12){
  monthsub <- subset(fooddata2017, fooddata2017[,1]==i)
  monthsub$V5 <- as.numeric(monthsub$V5)
  monthsub <- sum(monthsub[,4])
  total2017[i,2] <- monthsub
}
total2017 <- data.frame(total2017)
sum2017 <- sum(total2017[,2])
##### analysis for year 2016 by month ####  
total2016 <- matrix(nrow=12, ncol=2)
total2016[,1] <- c("January","February","March","April","May","June","July","August","September","October","November","December")
for (i in 1:12){
  monthsub <- subset(fooddata2016, fooddata2016[,1]==i)
  monthsub$V5 <- as.numeric(monthsub$V5)
  monthsub <- sum(monthsub[,4])
  total2016[i,2] <- monthsub
}
total2016 <- data.frame(total2016)
sum2016 <- sum(total2016[,2])
##### analysis for year 2015 by month ####
total2015 <- matrix(nrow=12, ncol=2)
total2015[,1] <- c("January","February","March","April","May","June","July","August","September","October","November","December")
for (i in 1:12){
  monthsub <- subset(fooddata2015, fooddata2015[,1]==i)
  monthsub$V5 <- as.numeric(monthsub$V5)
  monthsub <- sum(monthsub[,4])
  total2015[i,2] <- monthsub
}
total2015 <- data.frame(total2015)
sum2015 <- sum(total2015[,2])
##### analysis for year 2014 by month ####
total2014 <- matrix(nrow=12, ncol=2)
total2014[,1] <- c("January","February","March","April","May","June","July","August","September","October","November","December")
for (i in 1:12){
  monthsub <- subset(fooddata2014, fooddata2014[,1]==i)
  monthsub$V5 <- as.numeric(monthsub$V5)
  monthsub <- sum(monthsub[,4])
  total2014[i,2] <- monthsub
}
total2014 <- data.frame(total2014)
sum2014 <- sum(total2014[,2])
##### analysis for year 2013 by month ####
total2013 <- matrix(nrow=12, ncol=2)
total2013[,1] <- c("January","February","March","April","May","June","July","August","September","October","November","December")
for (i in 1:12){
  monthsub <- subset(fooddata2013, fooddata2013[,1]==i)
  monthsub$V5 <- as.numeric(monthsub$V5)
  monthsub <- sum(monthsub[,4])
  total2013[i,2] <- monthsub
}
total2013 <- data.frame(total2013)
sum2013 <- sum(total2013[,2])
##### analysis for year 2012 by month ####
total2012 <- matrix(nrow=12, ncol=2)
total2012[,1] <- c("January","February","March","April","May","June","July","August","September","October","November","December")
for (i in 1:12){
  monthsub <- subset(fooddata2012, fooddata2012[,1]==i)
  monthsub$V5 <- as.numeric(monthsub$V5)
  monthsub <- sum(monthsub[,4])
  total2012[i,2] <- monthsub
}
total2012 <- data.frame(total2012)
sum2012 <- sum(total2012[,2])
##### analysis for year 2011 by month ####
total2011 <- matrix(nrow=12, ncol=2)
total2011[,1] <- c("January","February","March","April","May","June","July","August","September","October","November","December")
for (i in 1:12){
  monthsub <- subset(fooddata2011, fooddata2011[,1]==i)
  monthsub$V5 <- as.numeric(monthsub$V5)
  monthsub <- sum(monthsub[,4])
  total2011[i,2] <- monthsub
}
total2011 <- data.frame(total2011)
sum2011 <- sum(total2011[,2])
##### analysis for year 2010 by month ####
total2010 <- matrix(nrow=12, ncol=2)
total2010[,1] <- c("January","February","March","April","May","June","July","August","September","October","November","December")
for (i in 1:12){
  monthsub <- subset(fooddata2010, fooddata2010[,1]==i)
  monthsub$V5 <- as.numeric(monthsub$V5)
  monthsub <- sum(monthsub[,4])
  total2010[i,2] <- monthsub
}
total2010 <- data.frame(total2010)
sum2010 <- sum(total2010[,2])
##### analysis for year 2009 by month ####
total2009 <- matrix(nrow=12, ncol=2)
total2009[,1] <- c("January","February","March","April","May","June","July","August","September","October","November","December")
for (i in 1:12){
  monthsub <- subset(fooddata2009, fooddata2009[,1]==i)
  monthsub$V5 <- as.numeric(monthsub$V5)
  monthsub <- sum(monthsub[,4])
  total2009[i,2] <- monthsub
}
total2009 <- data.frame(total2009)
sum2009 <- sum(total2009[,2])
##### analysis for year 2008 by month ####
total2008 <- matrix(nrow=12, ncol=2)
total2008[,1] <- c("January","February","March","April","May","June","July","August","September","October","November","December")
for (i in 1:12){
  monthsub <- subset(fooddata2008, fooddata2008[,1]==i)
  monthsub$V5 <- as.numeric(monthsub$V5)
  monthsub <- sum(monthsub[,4])
  total2008[i,2] <- monthsub
}
total2008 <- data.frame(total2008)
sum2008 <- sum(total2008[,2])







helperfunction1 <- function(z){
  currentdata <- get(paste("total",z,sep = ""))
  bar2018 <- ggplot(data=currentdata, aes(x=  factor(c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec") , level=c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")),y=currentdata[,2]) ) +
    geom_bar(stat="identity")
  bar2018 + ggtitle(paste("Total Amount of Food per Month from", z))+
    xlab("Month")+ ylab("Total Amount of Food in Pounds")
}

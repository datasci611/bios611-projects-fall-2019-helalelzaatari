library(tidyr)
library(ggplot2)
library(dplyr)
library(tidyverse)
library(magrittr)
library(lubridate)
library(ggplot2)


dataset <- read.table("C:\\Users\\Helal\\Desktop\\UMD_Services_Provided_20190719.tsv.txt", fill=TRUE, header=FALSE)
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
```

### we plot the results for a single year 2018 in a bar graph below


bar2018 <- ggplot(data=total2018, aes(x=  factor(c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec") , level=c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")),y=total2018[,2]) ) +
  geom_bar(stat="identity")
bar2018 + ggtitle("Total Amount of Food per Month from 2018")+
  xlab("Month")+ ylab("Total Amount of Food in Pounds")


### we plot the results for the year 2009
bar2009 <- ggplot(data=total2016, aes(x=  factor(c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec") , level=c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")),y=total2009[,2]) ) +
  geom_bar(stat="identity")
bar2009 + ggtitle("Total Amount of Food per Month from 2009")+
  xlab("Month")+ ylab("Total Amount of Food in Pounds")

### We can see from the graph that the month of december has a low amount of food compared to the other months. We want to sum all the food per month for the years 2008-2018 in order to see if we can find any trends for certain months. 

### summing all the years for each individual month
totaljan <- sum(c(36249,17280,17381,21873,21175,25516,25125,30292,26540,28121,29993))
totalfeb <- sum(c(31687,14618,15745,17801,20389,20216,21428,24264,21895,27419,24890))
totalmarch <- sum(c(31995,13493,24677,23375,24880,20395,20883,24357,28926,31145,29582))
totalapril <- sum(c(31635,15583,21603,22232,21476,19435,24089,29292,30994,28860,25569))
totalmay <-   sum(c(34874,13349,17837,20838,19228,20264,23673,25455,27336,27518,29815))
totaljune <-  sum(c(32474,17287,20854,19727,21088,21479,22520,28988,30601,32337,32512))
totaljuly <- sum(c(32762,19235,18860,21635,19897,17622,26066,29878,31266,28181,27145))
totalaugust <- sum(c(35676,10656,18395,22650,24099,27205,28407,27083,30098,31738,32151))
totalsept <- sum(c(31924,12677,24573,23805,20589,25145,26769,27111,30564,31259,29600))
totaloctober <- sum(c(36292,16403,23287,20192,23279,26226,30634,30151,28980,33213,35334))
totalnov <- sum(c(34368,14544,23911,20971,25453,25306,25263,27657,28553,30504,37027))
totaldec <- sum(c(24267,18652,25628,23208,25625,27623,27021,25713,28310,24589,27552))
totalbymonth <- c(totaljan,totalfeb,totalmarch,totalapril,totalmay,totaljune,totaljuly,totalaugust,totalsept,totaloctober,
                  totalnov,totaldec)
totalbymonth <- data.frame(totalbymonth)

### transform months of interest february and october into dataframes so we can manipulate them.
febperyear <- data.frame(c(31687,14618,15745,17801,20389,20216,21428,24264,21895,27419,24890))
octperyear <- data.frame(c(36292,16403,23287,20192,23279,26226,30634,30151,28980,33213,35334))

## we calculate the mean for all the months over the years 2008-2018
totalmean <- colMeans(totalbymonth)

### plot the bar graph per month for the years 2008-2018 and add a y-intercept for the average over all months


baryear <- ggplot(data=totalbymonth, aes(x=  factor(c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec") , level=c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")),y=totalbymonth)) +
  geom_bar(stat="identity")
baryear + ggtitle("Total Amount of Food per Month from 2008-2018")+
  xlab("Month")+ ylab("Total Amount of Food in Pounds") + geom_hline(yintercept=totalmean, linetype="dashed", color="red")

### We see that February and October are significantly lower and higher than the average respectively so we focus on these two months.



### calculate variance and standard deviation for the months of october and february
varoctober <- var(c(36292,16403,23287,20192,23279,26226,30634,30151,28980,33213,35334))
SEoct <- varoctober^0.5
varfebruary <- var(c(31687,14618,15745,17801,20389,20216,21428,24264,21895,27419,24890))
sefeb <- varfebruary^0.5


### calculate the mean for the months of october and february

meanfeb <- mean(c(31687,14618,15745,17801,20389,20216,21428,24264,21895,27419,24890))
meanoct <- mean(c(36292,16403,23287,20192,23279,26226,30634,30151,28980,33213,35334))


### we standardize the values so that we can use central limit theorem
normal <- matrix(nrow=11, ncol=1)
for (i in 1:11){
normal[i,1]<- (febperyear[i,1] - meanfeb)/sefeb
}

normaloct <- matrix(nrow=11, ncol=1)
for (i in 1:11){
  normaloct[i,1]<- (octperyear[i,1] - meanoct)/SEoct
}


### we plot the histograms for both october and february and see whether they obey central limit theorem

h <- hist(normal, breaks=4,
  xlab = "Standardized Values for amount of food for the month of February",
  ylab = "Number of years",
  main = "Histogram for the standardized amount of food for February")

h <- hist(normaloct, breaks=4,
          xlab = "Standardized Values for amount of food for the month of October",
          ylab = "Number of years",
          main = "Histogram for the standardized amount of food for October")


#### We see that they obey the central limit theorem, but n=11 so we might get better convergence if our n ( which is number of years) number of years
#### is close to n=25. This will help us later on if we want to test this significance but this test was not done in this project.
### Results: we see that October on average was 10% higher 

### Conclusion: in the end UMD can know that the month of February experiences a reduction in food demand of 14% as compared to the average
### for other months. October experienced an increase in food amount by 10% as compared to the average for other months. With this analysis
### UMD can adequately plan and prepare in specific for these months.
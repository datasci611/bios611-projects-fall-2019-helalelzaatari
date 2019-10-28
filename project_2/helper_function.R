library(ggplot2)
library(dplyr)
library(tidyr)

## function which loads and filters the data


load_data = function(){
  dataset <- read.table("C:\\Users\\Helal\\Desktop\\shiny\\UMD_Services_Provided_20190719.tsv.txt", fill=TRUE, header=FALSE)
  dates = dataset %>% 
    separate(V1, into=c("Month", "Day", "Year")) 
  
  dates <- dates[,c(1,3,6,7)]
  dates <- dates[-1,]
  
  dates$Month <- as.numeric(dates$Month)
  
  fooddatabymonth <- dates[order(dates$Month),]
  fooddatabyyear <- dates[order(dates$Year),]
  
  return(fooddatabymonth)
}

mydata <- load_data()

df_by_year <- list()
for (i in 1:11) {
  year = 2007 + i
  df_by_year[[i]] <- mydata %>%
    filter(Year == year)
}

helper_function <- function(input){
  total2017 <- matrix(nrow=12, ncol=2)
  total2017[,1] <- c("January","February","March","April","May","June","July","August","September","October","November","December")
  
  for (i in 1:12){
    monthsub <- subset(df_by_year[[input - 2007]], df_by_year[[input - 2007]][,1]==i)
    monthsub$V5 <- as.numeric(monthsub$V5)
    monthsub <- sum(monthsub[,4])
    total2017[i,2] <- monthsub
  }
  total2017 <- data.frame(total2017)
  
  bar2018 <- ggplot(data=total2017, aes(x=  factor(c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec") , level=c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")),y=total2017[,2]) ) +
    geom_bar(stat="identity") + ggtitle(paste("Total Amount of Food per Month from", input))+
    xlab("Month")+ ylab("Total Amount of Food in Pounds")
  
  return(bar2018)
}
  



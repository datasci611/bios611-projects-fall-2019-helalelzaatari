library(tidyverse)
library(ggplot2)


## load the data.

wrangled_demo <- read.table("C:\\Users\\Helal\\Desktop\\BIOS 611\\cleandata.txt",sep = ",", fill=TRUE, header=FALSE)
demographics <- read.table("C:\\Users\\Helal\\Desktop\\CLIENT_191102.tsv.txt", fill=TRUE, header=FALSE)

## doing some demographic analysis 
age_entry <- demographics[17]

age_entry <- age_entry[-1, ,drop = FALSE]
age_entry <- age_entry[-(4200:5408), ,drop = FALSE]
age_entry <- data.matrix(age_entry, rownames.force = NA)

## want to plot histogram of the age of clients that arrived for help

hist(age_entry, main="Age of Entry", xlab="Age (years)")

## same histogram but for the age of clients when they left

age_depart <- demographics[18]
age_depart <- age_depart[-1, ,drop = FALSE]
age_depart <- age_depart[-(4200:5408), ,drop = FALSE]
age_depart <- data.matrix(age_depart, rownames.force = NA)

hist(age_depart, main="Age at Exit", xlab="Age (years)")

mean_enter <- mean(age_entry)
mean_depart <- mean(age_depart)


# I will make this histogram of the average time spent more accurate by using the wrangled data in from my python code.
wrangled_demo[,6] <- sapply(wrangled_demo[,6], as.numeric)


difference <- matrix(nrow=2254,ncol=2)
friend_diff <- matrix(nrow=2254, ncol=2)
sum_total <- 0
var<- 0

for (i in 2:2254){
  difference[i-1,2] <- wrangled_demo[i,6]
  sum_total <- sum_total + wrangled_demo[i,6]
  var <- var + (wrangled_demo[i,6] - 127)^2
}

## mean and variance
total_mean <- sum_total / 2254
variance <- var / 2252


hist(difference[,2], main="Histogram of time spent", xlab="Number of Days Stayed")

### define variables
sum_tempfriend <-0
sum_permfam <- 0
sum_famtemp <- 0
sum_permfriend <- 0
sum_rent <- 0
sum_hosp <- 0

## now we do the same demographic analysis but for each destination group and temporary/permanent tenure

for (i in 2:2254){
  if (wrangled_demo[i,3] == "Staying or living with friends, temporary tenure (HUD)"){
    friend_diff[i-1,2] <- difference[i-1,2]
    friend_diff[i-1,1] <- paste(wrangled_demo[i,3])
    sum_tempfriend <- sum_tempfriend + difference[i-1,2]
  }
}

for (i in 2:2254){
  if (wrangled_demo[i,3] == "Staying or living with family, permanent tenure (HUD)"){
    friend_diff[i-1,2] <- difference[i-1,2]
    friend_diff[i-1,1] <- paste(wrangled_demo[i,3])
    sum_permfam <- sum_permfam + difference[i-1,2]
  }
}

for (i in 2:2254){
  if (wrangled_demo[i,3] == "Staying or living with family, temporary tenure (HUD)"){
    friend_diff[i-1,2] <- difference[i-1,2]
    friend_diff[i-1,1] <- paste(wrangled_demo[i,3])
    sum_famtemp <- sum_famtemp + difference[i-1,2]
  }
}

for (i in 2:2254){
  if (wrangled_demo[i,3] == "Staying or living with friends, permanent tenure (HUD)"){
    friend_diff[i-1,2] <- difference[i-1,2]
    friend_diff[i-1,1] <- paste(wrangled_demo[i,3])
    sum_permfriend <- sum_permfriend + difference[i-1,2]
  }
}

for (i in 2:2254){
  if (wrangled_demo[i,3] == "Rental by client, no ongoing housing subsidy (HUD)"){
    friend_diff[i-1,2] <- difference[i-1,2]
    friend_diff[i-1,1] <- paste(wrangled_demo[i,3])
    sum_rent <- sum_rent + difference[i-1,2]
  }
}

for (i in 2:2254){
  if (wrangled_demo[i,3] == "Hospital or other residential non-psychiatric medical facility (HUD)"){
    friend_diff[i-1,2] <- difference[i-1,2]
    friend_diff[i-1,1] <- paste(wrangled_demo[i,3])
    sum_hosp <- sum_hosp + difference[i-1,2]
  }
}



friend_diff <- na.omit(friend_diff)  # we omit the NA rows

### calculate means for each group and subgroup

mean_friend <- (sum_permfriend + sum_tempfriend) /821
mean_family <- (sum_permfam + sum_famtemp) /425
mean_perm <- (sum_permfam + sum_permfriend) / 72
mean_temp <- (sum_tempfriend + sum_famtemp) / 1174
mean_rent <- sum_rent / 111
mean_hosp <- sum_hosp / 85

friend_diff <- data.frame(friend_diff)

ggplot(friend_diff, aes(x=as.numeric(friend_diff$X2), y=friend_diff$X1)) +
  geom_boxplot(notch=TRUE) + xlab("Number of Days") + ylab("Destinations") + ggtitle("Nothced Boxplot for different Destinations")+
  geom_vline(xintercept=127, linetype="dashed", color="red")



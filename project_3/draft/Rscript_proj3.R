library(tidyverse)
library(ggplot2)


## load the data.

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

## average time spent is approximately 2 years let us plot a histogram for the difference

age_diff <- age_depart - age_entry
hist(age_diff)

# we clearly see that most clients spent more than a year but not more than 2 years.

# I will make this histogram of the average time spent more accurate by using the wrangled data in from my python code.
## but this gives us a rough idea of the average time spent

## histogram for gender of client

gender_data <- demographics[19]

gender_plot <- 




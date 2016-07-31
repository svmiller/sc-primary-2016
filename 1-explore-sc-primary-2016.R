library(RCurl)

data <- getURL("https://raw.githubusercontent.com/svmiller/sc-primary-2016/master/sc-primary-2016.csv")
Data <- read.csv(text = data)

round(mean(Data$trump), 3)
round(median(Data$trump), 3)

plot(density(Data$trump), 
     main="Density Plot of Trump Vote Share in \n 2016 SC Primary", 
     xlab="Range of Trump Vote Share")
     
  
round(mean(Data$population), 3)
round(median(Data$population), 3)

plot(density(Data$population), 
     main="Density Plot of the Population of SC's Counties", 
     xlab="Range of the County Populations")

Data$logpop <- log(Data$population)

round(mean(Data$logpop), 3)
round(median(Data$logpop), 3)

plot(density(Data$logpop), 
     main="Density Plot of the Population of SC's Counties \n (Logged)", 
     xlab="Range of the Logged County Populations")
     
M1 <- lm(trump ~ illiteracy +  unemployment + perblack, Data)
summary(M1)

## read data into R
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)
names(outcome)
nrow(outcome)

outcome[,11] <- as.numeric(outcome[,11])
hist(outcome[,11])
summary(outcome[,11])
head(outcome[,11])

subdata <- outcome[which(outcome$State == "NY"),11]
head(subdata)

StateName <- outcome$State
if (sum(grepl("BB",StateName)) == 0){
      cat("invalid state")
}

subdata <- outcome[which(outcome$State == "NY"),c(2,11)]
summary(subdata)
good <- complete.cases(subdata)
subdata <- subdata[good,]
min <- min(subdata[,2])





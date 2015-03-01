best <- function(state, outcome) {
      ## Read outcome data
      outcomedata <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
      ## Check that state and outcome are valid
      # check the state
      stateName <- outcomedata$State
      tem <- grepl(state,stateName)
      if (sum(tem) == 0){
            stop("invalid state")
      }
      # check the outcome
      if (outcome == "heart attack"){
            subdata <- outcomedata[which(outcomedata$State == state),c(2,11)]
      } else if (outcome == "heart failure"){
            subdata <- outcomedata[which(outcomedata$State == state),c(2,17)]
      } else if (outcome == "pneumonia"){
            subdata <- outcomedata[which(outcomedata$State == state),c(2,23)]
      } else {
            stop("invalid outcome")
      }
      ## Return hospital name in that state with lowest 30-day death
      x <- character()
      subdata[,2] <- as.numeric(subdata[,2])
      good <- complete.cases(subdata)
      subdata <- subdata[good,]
      min <- min(subdata[,2])
      m <- nrow(subdata)
      for (i in 1:m){
            if (subdata[i,2] == min){
                  x <- subdata[i,1]
            }
      }
      ## rate
      x
}
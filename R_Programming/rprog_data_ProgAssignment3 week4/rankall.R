rankall <- function(outcome, num = "best") {
      ## Read outcome data
      outcomedata <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
      # check the outcome
      if (outcome == "heart attack"){
            subdata <- outcomedata[,c(2,7,11)]
      } else if (outcome == "heart failure"){
            subdata <- outcomedata[,c(2,7,17)]
      } else if (outcome == "pneumonia"){
            subdata <- outcomedata[,c(2,7,23)]
      } else {
            stop("invalid outcome")
      }
      ## For each state, find the hospital of the given rank
      ## remove na
      for (i in 1:nrow(subdata)){
            if (subdata[i,3] == "Not Available"){
                  subdata[i,3] <- NA
            }
      }
      good <- complete.cases(subdata[,3])
      subdata <- subdata[good,]
      ## split by state name
      subdata[,3] <- as.numeric(subdata[,3])
      s <- split(subdata,subdata$State)
      ans <- lapply(s,function(x,num){
            ## order data by death rate and hospital names
            x <- x[order(x[,3],x[,1]),]
            # return value
            if (num == "best"){
                  return(x$Hospital.Name[1])
            } else if (num == "worst"){
                  return(x$Hospital.Name[nrow(x)])
            } else {
                  return(x$Hospital.Name[num])
            }
      }, num)
      ## Return a data frame with the hospital names and the
      ## (abbreviated) state name
      return(data.frame(hospital=unlist(ans), state=names(ans)))
}
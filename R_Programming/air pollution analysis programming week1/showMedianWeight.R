showMedianWeight <- function(directory, day){
      filePath <- list.files(directory, full.name = TRUE)
      everybody <- data.frame()
      for (i in 1:length(filePath)) {
            everybody <- rbind(everybody, read.csv(filePath[i]))
      }
      givenDay <- everybody[which(everybody$Day == day),]
      medianWeight <- median(givenDay$Weight,na.rm = TRUE)
      medianWeight
}


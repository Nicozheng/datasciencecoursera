pollutantmean <- function(directory, pollutant, id = 1:332) {
	## input files
	filePath <- list.files(directory, full.name = TRUE)
	tmp <- vector(mode = "list", length= length(filePath))
	tmp <- lapply(filePath, read.csv)
	airpollutant <- do.call(rbind, tmp)
	## subset files
	subpollutant = data.frame()
	for (i in id){
		subpollutant <- rbind(subpollutant,airpollutant[which(airpollutant$ID == i), ])
	}
	#print(str(subpollutant))
	## caculate mean
	Mean <- mean(subpollutant[,pollutant], na.rm = TRUE)
      Mean
}

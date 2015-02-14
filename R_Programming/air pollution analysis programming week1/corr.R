corr <- function(directory, threshold = 0) {
	## input files
	filePath <- list.files(directory, full.name = TRUE)
	tmp <- vector(mode = "list", length= length(filePath))
	tmp <- lapply(filePath, read.csv)
	airpollutant <- do.call(rbind, tmp)
	## subset the completely cases above threshold
	comcases <- complete("specdata") 
	aboveThreshold <- comcases[which(comcases$nobs > threshold),]
	aboveID <- aboveThreshold$id
    # print(aboveID)
	subcases <- data.frame()
	for (i in aboveID){
		subcases <- rbind(subcases,airpollutant[which(airpollutant$ID == i),])		
	}
	good <- complete.cases(subcases)
	subcases <- subcases[good,]
	## caculate the correlation of two variables
	cr <- numeric()
	for (x in aboveID){
		minisub <- subcases[which(subcases$ID == x),]
      	nitrateAbove <- minisub$nitrate
      	sulfateAbove <- minisub$sulfate
      	cr <- append(cr,cor(nitrateAbove,sulfateAbove))
    }
    cr
}
getmonitor <- function(id, directory, summarize = FALSE) {
  ##############################################################################
  if ( nchar(id) == 1 ) {
    id <- paste("00", id, sep="")
  } else if ( nchar(id) == 2 ){
    id <- paste("0", id, sep="")
  } 
  file<-id
  ##############################################################################
  datacsv <- read.csv(paste(directory,'/',file,'.csv',sep=''), header = TRUE)
  ##############################################################################
  if (summarize == TRUE) 
    print(summary(datacsv))
  
  return(datacsv)
  ##############################################################################
}
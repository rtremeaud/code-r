dd <- read.csv("~/Downloads/hw1_data.csv")
ddd<-subset.data.frame(dd,dd$Ozone>31 & dd$Temp>90)

setwd("/Users/raf/Desktop/coursesDATA/specdata")
#################################################################################
complete <- function(directory, id = 1:332) {
## 'directory'
dir<-getwd()
directory<-read.csv(paste(dir,'/',directory,'.csv',sep=''), header = TRUE)
##id
if ( nchar(id) == 1 ) {
  id <- paste("00", id, sep="")
} else if ( nchar(id) == 2 ){
  id <- paste("0", id, sep="")
} 
##
print(summary(datacsv))

return(datacsv)
#################################################################################
getmonitor <- function(id, directory, summarize = FALSE) {
  if ( nchar(id) == 1 ) {
    id <- paste("00", id, sep="")
  } else if ( nchar(id) == 2 ){
    id <- paste("0", id, sep="")
  } 
  file<-id
    datacsv <- read.csv(paste(directory,'/',file,'.csv',sep=''), header = TRUE)
    

    if (summarize == TRUE) 
      print(summary(datacsv))
    
    return(datacsv)
    
  }
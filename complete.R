complete <- function(directory, id = 1:332) {
    fn <- dir(directory)
  idx <- as.numeric(substr(fn,1,3))
  fn <- paste(directory,"/",fn,sep="")

  names(fn) <- idx
  
  ret = data.frame("id"=0,"nobs"=0)  
  
  for (i in id) {
    
 dat <- read.csv(fn[i])
     dat <- dat[complete.cases(dat),]
    count <- dim(dat)[1]
    ret <- rbind(ret,list("id"=i,"nobs"=count),deparse.level = 2)

  }
  
  ret <- ret[2:dim(ret)[1],]
rownames(ret) <- NULL
  return(ret)
  
}
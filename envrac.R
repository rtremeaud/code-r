outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
#Add a label to the x-axis that says “30-day Death Rate”
#Add a title for the histogram that says “Heart Attack 30-day Death Rate”

 hist(outcome[, 11],main="Heart Attack 30-day Death Rate",xlab = "30-day Death Rate")
 
 cat(outcome$State)
 setwd("~/Desktop/coursesDATA/semaine3")
best <-
}
function(state, outcome) {
 ## Read outcome data
 subset(outcome,State %in% c("TX"))
#########################################
## Check that state and outcome are valid
 is_something <- function(x)
{
  if(!some_condition) return(FALSE)
  if(!some_other_condition) return(FALSE)
  #etc.
  return(TRUE)
}
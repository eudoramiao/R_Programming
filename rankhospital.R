##R Programming -- Programming Assignment 3
##7/28/2019
##3

rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  df <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  ## Check that state and outcome are valid
  stateslist <- unique(df$State)
  outcomelist = as.character(c("heart attack", "heart failure", "pneumonia"))
  ## Return hospital name in that state with the given rank 30-day death rate
  colSort <- function(data, ...) sapply(data, sort, ...)
  df1 <- colSort(subset(df, State == state, outcome == outcome), decreasing = FALSE)
  
  if (num = "best"){
    df2 <- subset(df1, )
  }
}


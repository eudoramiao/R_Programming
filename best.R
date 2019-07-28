##R Programming -- Programming Assignment 3
##7/28/2019
#2

best <- function(state, outcome) {
  ## Read outcome data
  df <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  ## Check taht state and outcome are valid
  stateslist <- unique(df$State)
  outcomelist = as.character(c("heart attack", "heart failure", "pneumonia"))
  if (state %in% stateslist == FALSE) stop ("invalid state")
  if (outcome %in% outcomelist == FALSE) stop ("invalid outcome")
  ## Return hospital name in that state with lowest 30-day death rate
  if (outcome == "heart attack"){
    df1 <- subset(df, State == state, select = c("Hospital.Name", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"))
  }
  if (outcome == "heart failure"){
      df1 <- subset(df, State == state, select = c("Hospital.Name", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"))
  }
  else{
    df1 <- subset(df, State == state, select = c("Hospital.Name", "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"))
  }
  maxnum <- max(as.numeric(df1[,2]), na.rm = TRUE)
  df3 <- subset(df, df[,2] == maxnum) 
  df4 = sort(df3[,1])
  output = df4
  output
} 

best("TX", "heart attack")  
  
  
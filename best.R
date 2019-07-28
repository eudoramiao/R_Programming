##R Programming -- Programming Assignment 3
##7/28/2019
#2

best <- function(state, outcome) {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv")
  
  ## Check that state and outcome are valid
  stateslist <- levels(data[, 7]) [data[, 7]]
  if (state %in% stateslist == FALSE) stop ("invalid state")
  if (!((outcome == "heart attack") | (outcome == "heart failure")
        | (outcome == "pneumonia"))) {
    stop ("invalid outcome")
  }
  
  ## Return hospital name in that state with lowest 30-day death rate
  col <- if (outcome == "heart attack") {
    11
  } else if (outcome == "heart failure") {
    17
  } else {
    23
  }
  
  data[, col] <- suppressWarnings(as.numeric(levels(data[, col])[data[, col]]))
  data[, 2] <- as.character(data[, 2])
  statedata <- data[grep(state, data$State), ]
  orderdata <- statedata[order(statedata[, col], statedata[, 2], na.last = NA), ]
  orderdata[1, 2]
}

  
  
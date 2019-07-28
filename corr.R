##R Programming -- Programming Assignment 1: Air Pollution -- Q3
source("complete.R")
corr <- function(directory, threshold = 0) {
  files_full <- list.files(directory, full.names=TRUE) #creates a list of files
  output <- numeric() #creates an empty data frame
  for (i in 1:332) {
    file = read.csv(files_full[i])
    dat_subset <- subset(file, !is.na(sulfate), !is.na(nitrate))
    if (nrow(dat_subset) >= threshold) { #test if number of measurements passes threshold
      cor1 <- cor(dat_subset$sulfate, dat_subset$nitrate, use = "pairwise.complete.obs")
      output <- append(output, cor1)
      #bind subsets of data (with NA removed) if they pass certain threshold
    }
  }
  if (length(output) > 0){
    return (output)
  }
  else{
    return (numeric(0))
  }
}
  


#in parts
files_full <- list.files("specdata", full.names=TRUE)
file = read.csv(files_full[2])

#test
cr <- corr("specdata", 150)

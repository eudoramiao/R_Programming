##R Programming -- Programming Assignment 1: Air Pollution -- Q1

##Write a function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate) across a specified list of monitors.
pollutantmean <- function (directory, pollutant, id = 1:332) {
  files_full <- list.files(directory, full.names=TRUE) #creates a list of files
  dat <- data.frame() #creates an empty data frame
  for (i in id) {
    #loops through the files, rbinding them together
    dat <- rbind (dat, read.csv(files_full[i]))
  }
  dat_subset <- dat[, pollutant] #subsets the rows of the input pollutant
  mean (dat_subset, na.rm = TRUE) #calculates the mean pollution measurement while stripping out the NAs
}

##test in parts
files_full <- list.files("specdata", full.names=TRUE)
dat <- data.frame()
dat <- rbind (dat, read.csv(files[1]))

#test
pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "sulfate", 1:10)

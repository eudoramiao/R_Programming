##R Programming -- Programming Assignment 1: Air Pollution -- Q2

complete <- function (directory, id) {
  files_full <- list.files(directory, full.names=TRUE)
  dat <- data.frame(id=numeric(), nobs=numeric())
  n = 1
  for (i in id) {
    file = read.csv(files_full[i])
    dat_subset <- subset(file, !is.na(sulfate), !is.na(nitrate))
    dat[n, 1] <- i
    dat[n, 2] <- nrow(dat_subset)
    n = n+1
  }
  dat
}

#in parts
files_full <- list.files("specdata", full.names=TRUE)
file = read.csv(files_full[2])
subset(file, !is.na(sulfate), !is.na(nitrate))
file[is.na("sulfate")]

#test
complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)

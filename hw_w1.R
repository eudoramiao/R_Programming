data <- read.csv("hw1_data.csv")

head(data, n = 2L)

tail(data, n = 2L)

nrow(data)

data[47,1]

ozone <- data[,1]

ozonena <- is.na (ozone)
ozonenalist <- ozone[ozonena]
length(ozonenalist)
##or use which (which indices are true)
length(which(is.na(ozone)))

mean(ozone, na.rm = TRUE)

data1 <- data[which(data$Ozone > 31 & data$Temp >90), 2]
mean(data1)

data2 <- data[which(data$Month == "6"), 4]
mean(data2)

data3 <- data[which(data$Month == "5"), 1]
max(data3, na.rm = TRUE)

# Created: 2020-04-28

# This script runs the code to recreate plot 1
# Plot 1 is a histogram showing the distribution of households according to
#     their global active power usage.

# loading relevant libraries
library(lubridate)

# reading the data
data <- read.table("household_power_consumption.txt", sep=";")

# converting dates and times to R formats
data$timeStamp <- with(data, dmy_hms(paste(V1, V2)))

# selecting the required data for 2007-02-01 and 2007-02-01
reqData <- data[as.character(data$V1) == "1/2/2007" | data$V1 == "2/2/2007", ]
reqData$V3 <- as.numeric(as.character(reqData$V3))

# plotting
with(reqData, hist(V3, col="red", xlab="Global Active Power (kilowatts))", main="Global Active Power"))

dev.copy(png, file="plot1.png")
dev.off()
# Created: 2020-04-28

# This script runs the code to recreate plot 2
# Plot 2 shows the global active power usage vs time.

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
with(reqData, plot(timeStamp, V3, type="l", ylab="Global Active Power (kilowatts)", xlab=""))

# sending to a png graphics device
dev.copy(png, file="plot2.png")
dev.off()
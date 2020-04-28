# Created: 2020-04-28

# This script runs the code to recreate plot 4
# Plot 4 shows (clockwise from top left):
#     1. Global active power vs time
#     2. Voltage vs time
#     3. Global reactive power vs time
#     4. Energy sub metering vs time

# loading relevant libraries
library(lubridate)

# reading the data
data <- read.table("household_power_consumption.txt", sep=";")

# converting dates and times to R formats
data$timeStamp <- with(data, dmy_hms(paste(V1, V2)))

# selecting the required data for 2007-02-01 and 2007-02-01
reqData <- data[as.character(data$V1) == "1/2/2007" | data$V1 == "2/2/2007", ]

reqData$V3 <- as.numeric(as.character(reqData$V3))
reqData$V4 <- as.numeric(as.character(reqData$V4))
reqData$V5 <- as.numeric(as.character(reqData$V5))
reqData$V7 <- as.numeric(as.character(reqData$V7))
reqData$V8 <- as.numeric(as.character(reqData$V8))
reqData$V9 <- as.numeric(as.character(reqData$V9))

# setting global parameters
par(mfrow=c(2, 2))

# plotting
with(reqData, plot(timeStamp, V3, type="l", xlab="", ylab="Global Active Power"))

with(reqData, plot(timeStamp, V5, type="l", xlab="datetime", ylab="Voltage"))

with(reqData, plot(timeStamp, V7, type="l", xlab="", ylab="Energy sub metering"))
with(reqData, lines(timeStamp, V8, type="l", col="red"))
with(reqData, lines(timeStamp, V9, type="l", col="blue"))
legend("topright", col=c("black", "red", "blue"), lty="solid", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(reqData, plot(timeStamp, V4, type="l", xlab="datetime", ylab="Global_reactive_power"))

dev.copy(png, file="plot4.png")
dev.off()
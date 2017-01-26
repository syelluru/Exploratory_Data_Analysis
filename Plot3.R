########################################################################################################
# Design Name: Peer Graded Assignment - Course Project 1 - Exploratory Data Analysis(Coursera)
# Author: Suhas Yelluru 
# Create Date: Jan 25 2017; 19:24
# Description: Plot 3
########################################################################################################
rm(list = ls())
data <- read.table("household_power_consumption.txt", header = T, 
                   sep = ";", na.strings = "?")

# convert the date variable to Date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset the data
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert dates and times
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
png("plot3.png", width=480, height=480)
plot(data$datetime, data$Sub_metering_1, type = "l", 
     ylab = "Energy sub metering", xlab = "")
lines(data$datetime, data$Sub_metering_2, col = "Red")
lines(data$datetime, data$Sub_metering_3, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
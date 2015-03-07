getwd()
setwd("c:/Users//Phat//Desktop/ExData_Plotting1/")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "power.zip", mode = "wb")
unzip("power.zip")
power <- read.csv("household_power_consumption.txt", na.strings = "?", stringsAsFactors = F, sep = ";")
power <- power[power$Date %in% c("1/2/2007", "2/2/2007"), ]
power$Date <- as.Date(power$Date, "%d/%m/%Y")
power$TimeDate <- paste(power$Date, power$Time)
power <- transform(power, TimeDate = strptime(TimeDate, "%Y-%m-%d %H:%M:%S"))

# Global Active Power histogram
png("plot1.png", width = 480, height = 480)
with(power, hist(Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))
dev.off()

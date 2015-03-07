download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "power.zip", mode = "wb")
unzip("power.zip")
power <- read.csv("household_power_consumption.txt", na.strings = "?", stringsAsFactors = F, sep = ";")
power <- power[power$Date %in% c("1/2/2007", "2/2/2007"), ]
power$Date <- as.Date(power$Date, "%d/%m/%Y")
power$datetime <- paste(power$Date, power$Time)
power <- transform(power, datetime = strptime(datetime, "%Y-%m-%d %H:%M:%S"))

png("plot3.png", height = 480, width = 480)
with(power, plot(datetime, Sub_metering_1,  col = "black", type = "l", xlab = "", ylab = "Energy sub metering"))
with(power, lines(datetime, Sub_metering_2, col = "red"))
with(power, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))
dev.off()

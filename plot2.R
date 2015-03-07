download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "power.zip", mode = "wb")
unzip("power.zip")
power <- read.csv("household_power_consumption.txt", na.strings = "?", stringsAsFactors = F, sep = ";")
power <- power[power$Date %in% c("1/2/2007", "2/2/2007"), ]
power$Date <- as.Date(power$Date, "%d/%m/%Y")
power$TimeDate <- paste(power$Date, power$Time)
power <- transform(power, TimeDate = strptime(TimeDate, "%Y-%m-%d %H:%M:%S"))


png("plot2.png", width = 480, height = 480)
with(power, plot(x = TimeDate, y = Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l"))
dev.off()

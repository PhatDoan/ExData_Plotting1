# Getting the file from given URL
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "power.zip", mode = "wb")
unzip("power.zip")
power <- read.csv("household_power_consumption.txt", na.strings = "?", stringsAsFactors = FALSE, sep = ";")
# Selecting only records in 2007-02-01 and 2007-02-02
power <- power[power$Date %in% c("1/2/2007", "2/2/2007"), ]
# Convert the Date to R Date format
power$Date <- as.Date(power$Date, "%d/%m/%Y")
# Combine date and time to create new variable datetime
power$datetime <- paste(power$Date, power$Time)
power <- transform(power, datetime = strptime(datetime, "%Y-%m-%d %H:%M:%S"))

# open graphic device
png("plot4.png", height = 480, width = 480)

# Set the arrangement and margins
par(mfrow = c(2, 2))
par(mar = c(4, 4, 2, 2))

# Plot Global active power time series
with(power, plot(x = datetime, y = Global_active_power, xlab = "", ylab = "Global Active Power", type = "l"))

# Plot Volatage time series
with(power, plot(x = datetime, y = Voltage, type = "l"))

# Plot sub metering time series
with(power, plot(datetime, Sub_metering_1,  col = "black", type = "l", xlab = "", ylab = "Energy sub metering"))
with(power, lines(datetime, Sub_metering_2, col = "red"))
with(power, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))

# Plot Globe re-active power time series
with(power, plot(x = datetime, y = Global_reactive_power, type = "l"))
# Close graphic device and save the file
dev.off()

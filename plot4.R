# download, unzip and read file
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,"data.zip",method="curl")
unzip("data.zip")
data <- read.csv2("household_power_consumption.txt", na.strings = "?")

#convert to date and time formats and subset to give range
data$Date <- paste(data$Date,data$Time)
data$Date <- strptime(data$Date,"%d/%m/%Y %H:%M:%S")
reqd_data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02 23:59:59")

#plot 4
y <- as.numeric(as.character(reqd_data$Global_active_power))
y0 <- as.numeric(as.character(reqd_data$Voltage))
y1 <- as.numeric(as.character(reqd_data$Sub_metering_1))
y2 <- as.numeric(as.character(reqd_data$Sub_metering_2))
y3 <- as.numeric(as.character(reqd_data$Sub_metering_3))
y4 <- as.numeric(as.character(reqd_data$Global_reactive_power))

png(filename = "plot4.png", width=480, height=480)
par(mfrow = c(2,2))
with(reqd_data, {
        plot(Date, y, ylab="Global Active Power",type="l", xlab="")
        plot(Date, y0, ylab="Voltage", type="l", xlab="datetime")
        plot(Date, y1, ylab="Energy sub metering", type="l", xlab="")
        lines(Date, y2, col="Red")
        lines(Date, y3, col="Blue")
        legend("topright", bty="n", lty = c(1,1,1), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"))
        plot(Date, y4, xlab="datetime", ylab="Global_reactive_power", type="l")
})
dev.off()
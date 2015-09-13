# download, unzip and read file
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,"data.zip",method="curl")
unzip("data.zip")
data <- read.csv2("household_power_consumption.txt", na.strings = "?")

#convert to date and time formats and subset to given range
data$Date <- paste(data$Date,data$Time)
data$Date <- strptime(data$Date,"%d/%m/%Y %H:%M:%S")
reqd_data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02 23:59:59")

#plot 3
x <- reqd_data$Date
y1 <- as.numeric(as.character(reqd_data$Sub_metering_1))
y2 <- as.numeric(as.character(reqd_data$Sub_metering_2))
y3 <- as.numeric(as.character(reqd_data$Sub_metering_3))

png(filename="plot3.png", width=480, height=480)
        plot(x, y1, type="l", ylab="Energy sub metering", xlab="")
        lines(x, y2, col="red")
        lines(x, y3, col="blue")
        legend("topright", lty = c(1,1,1), 
               c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               col = c("black", "red", "blue"))
dev.off()

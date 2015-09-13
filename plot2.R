# download, unzip and read file
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,"data.zip",method="curl")
unzip("data.zip")
data <- read.csv2("household_power_consumption.txt", na.strings = "?")

#convert to date and time formats and subset to given range
data$Date <- paste(data$Date,data$Time)
data$Date <- strptime(data$Date,"%d/%m/%Y %H:%M:%S")
reqd_data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02 23:59:59")

#plot 2
x <- reqd_data$Date
y <- as.numeric(as.character(reqd_data$Global_active_power))
png(filename="plot2.png", width=480, height=480)
        plot(x, y, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()

setwd("E:\\Documents\\Exploratory Data Analysis\\Week 1\\Assig")
data <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880)
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power",
                 "Voltage","Global_intensity",
                 "Sub_metering_1","Sub_metering_2","Sub_metering_3")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- strptime(data$Time, format="%H:%M:%S")
data[1:1440,"Time"] <- format(data[1:1440,"Time"],"2007-02-01 %H:%M:%S")
data[1441:2880,"Time"] <- format(data[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

png("plot2.png", width=480, height=480)

plot(data$Time,as.numeric(data$Global_active_power),
     type="l",xlab="",ylab="Global Active Power (kilowatts)")

dev.off()
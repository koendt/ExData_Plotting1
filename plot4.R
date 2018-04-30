#load data
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";")
#create png file
png(file = "plot4.png")
#2by2
par(mfrow=c(2,2), mfcol=c(2,2))

#plot1/4
dataPlot2 <- subset(data, Global_active_power != "?")
dataPlot2$Global_active_power <- as.numeric(as.character(dataPlot2$Global_active_power))
dataPlot2 <- subset(dataPlot2, Date=="1/2/2007" | Date=="2/2/2007")
dataPlot2$pasteDateTime <- paste(dataPlot2$Date, dataPlot2$Time, sep=",")
dataPlot2$dateTime <- strptime(dataPlot2$pasteDateTime, "%d/%m/%Y,%H:%M:%S")
with(dataPlot2, plot(dateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power"))

#plot2/4
dataPlot3 <- subset(data, Sub_metering_1 != "?")
dataPlot3 <- subset(dataPlot3, Sub_metering_2 != "?")
dataPlot3 <- subset(dataPlot3, Sub_metering_3 != "?")
dataPlot3$Sub_metering_1 <- as.numeric(as.character(dataPlot3$Sub_metering_1))
dataPlot3$Sub_metering_2 <- as.numeric(as.character(dataPlot3$Sub_metering_2))
dataPlot3 <- subset(dataPlot3, Date=="1/2/2007" | Date=="2/2/2007")
dataPlot3$pasteDateTime <- paste(dataPlot3$Date, dataPlot3$Time, sep=",")
dataPlot3$dateTime <- strptime(dataPlot3$pasteDateTime, "%d/%m/%Y,%H:%M:%S")
with(dataPlot3, plot(dateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
lines(dataPlot3$dateTime,dataPlot3$Sub_metering_2, col="red", type="l")
lines(dataPlot3$dateTime, dataPlot3$Sub_metering_3, col="blue", type="l")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty='n', cex=.9, lty=1, col=c("black", "red", "blue"))

#plot3/4
dataPlot4 <- subset(data, Voltage != "?")
dataPlot4$Voltage <- as.numeric(as.character(dataPlot4$Voltage))
dataPlot4 <- subset(dataPlot4, Date=="1/2/2007" | Date=="2/2/2007")
dataPlot4$pasteDateTime <- paste(dataPlot4$Date, dataPlot4$Time, sep=",")
dataPlot4$dateTime <- strptime(dataPlot4$pasteDateTime, "%d/%m/%Y,%H:%M:%S")
plot4 <- with(dataPlot4, plot(dateTime, Voltage, type="l", xlab="datetime", ylab="Voltage"))

#plot4/4
dataPlot5 <- subset(data, Global_reactive_power != "?")
dataPlot5$Global_reactive_power <- as.numeric(as.character(dataPlot5$Global_reactive_power))
dataPlot5 <- subset(dataPlot5, Date=="1/2/2007" | Date=="2/2/2007")
dataPlot5$pasteDateTime <- paste(dataPlot5$Date, dataPlot5$Time, sep=",")
dataPlot5$dateTime <- strptime(dataPlot5$pasteDateTime, "%d/%m/%Y,%H:%M:%S")
plot5 <- with(dataPlot5, plot(dateTime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))

#close device
dev.off()

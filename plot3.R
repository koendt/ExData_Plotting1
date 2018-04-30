#load data
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";")
#remove missing
dataPlot3 <- subset(data, Sub_metering_1 != "?")
dataPlot3 <- subset(dataPlot3, Sub_metering_2 != "?")
dataPlot3 <- subset(dataPlot3, Sub_metering_3 != "?")
#change to numeric class
dataPlot3$Sub_metering_1 <- as.numeric(as.character(dataPlot3$Sub_metering_1))
dataPlot3$Sub_metering_2 <- as.numeric(as.character(dataPlot3$Sub_metering_2))
#subset Date
dataPlot3 <- subset(dataPlot3, Date=="1/2/2007" | Date=="2/2/2007")
#paste date time
dataPlot3$pasteDateTime <- paste(dataPlot3$Date, dataPlot3$Time, sep=",")
#strptime
dataPlot3$dateTime <- strptime(dataPlot3$pasteDateTime, "%d/%m/%Y,%H:%M:%S")
#create png file
png(file = "plot3.png")
#plot
with(dataPlot3, plot(dateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
lines(dataPlot3$dateTime,dataPlot3$Sub_metering_2, col="red", type="l")
lines(dataPlot3$dateTime, dataPlot3$Sub_metering_3, col="blue", type="l")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=.9, lty=1, col=c("black", "red", "blue"))
#close device
dev.off()
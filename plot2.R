#load data
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";")
#remove missing
dataPlot2 <- subset(data, Global_active_power != "?")
#change to numeric class
dataPlot2$Global_active_power <- as.numeric(as.character(dataPlot2$Global_active_power))
#subset Date
dataPlot2 <- subset(dataPlot2, Date=="1/2/2007" | Date=="2/2/2007")
#paste date time
dataPlot2$pasteDateTime <- paste(dataPlot2$Date, dataPlot2$Time, sep=",")
#strptime
dataPlot2$dateTime <- strptime(dataPlot2$pasteDateTime, "%d/%m/%Y,%H:%M:%S")
#create png file
png(file = "plot2.png")
##plot
with(dataPlot2, plot(dateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
#close device
dev.off()

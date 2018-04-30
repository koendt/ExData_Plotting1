#load data
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";")
#remove missing
data <- subset(data, Global_active_power != "?")
#change to numeric class
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
#subset Date
dataPlot1 <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")
#create png file
png(file = "plot1.png")
#plot histogram
hist(dataPlot1$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
#close device
dev.off()
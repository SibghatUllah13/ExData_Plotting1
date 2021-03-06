
Plot4<- function(FileName)
{
### Read and Convert Data ###  
data <- read.table(FileName, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

#### Start PNG 
png("plot4.png", width=480, height=480)
### Set the orientation of Graphs 
par(mfrow = c(2, 2)) 

## Draw the Graphs

## As per the 1st Graph
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

### As Per the 2nd Graph
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

### As Per in the third Graph
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

# 4th Graph
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
}
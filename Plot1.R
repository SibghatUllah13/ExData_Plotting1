
Plot1<- function(FileName) 
{

# Read the Data from the File and Store in data  
data <- read.table(FileName,header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#Only Select the Data that is required
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Convert the Global Active Power to Numeric to make a Graph
globalActivePower <- as.numeric(subSetData$Global_active_power)
#Start the PNG Device
png("plot1.png", width=480, height=480)

#Make Histogram
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
}
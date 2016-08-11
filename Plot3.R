

Plot3<- function(FileName)
{
  ### Read Data, and Convert it as Appropriate #####
  data<-read.table(FileName, header = FALSE, sep = ";", stringsAsFactors = FALSE, dec = ".")
  subsetData<- data[data$Date %in% c("1/2/2007","2/2/2007"),]
  datetime<- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
  datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
  
  #### Convert the Values to Numeric
  GAP <- as.numeric(subSetData$Global_active_power)
  subMetering1 <- as.numeric(subSetData$Sub_metering_1)
  subMetering2 <- as.numeric(subSetData$Sub_metering_2)
  subMetering3 <- as.numeric(subSetData$Sub_metering_3)
  
  #### Make PNG
  png("plot3.png", width=480, height=480)
  
  ### Plot The Basic Graph
  plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
  ### ADD SubMetering2 Data
  lines(datetime, subMetering2, type="l", col="red")
  
  ## ADD Submetering2 Data 
  lines(datetime, subMetering3, type="l", col="blue")
  #Draw the Legend
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
  dev.off()
  
}
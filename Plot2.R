

Plot2<- function(FileName)
{
  #Read the Data
  data<-read.table(FileName,header = FALSE, sep = ";", stringsAsFactors = FALSE, dec = ".")
  #Only Get the desired Data W.R.T Date
  subsetData<- data[data$Date %in% c("1/2/2007","2/2/2007"),]
  #Convert the Datetime Using R's builtin Function 
  datetime<- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
  GAP <- as.numeric(subSetData$Global_active_power)
  #Plot the Graph
  png("plot2.png", width=480, height=480)
  plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  dev.off()
}
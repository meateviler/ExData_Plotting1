#Read data
filename = "household_power_consumption.txt"
data = read.table(filename,header = TRUE,sep = ";",stringsAsFactors=FALSE,na = "?",dec=".")
# we just need those 2 days
newData = data[data$Date =="1/2/2007"|data$Date =="2/2/2007",]

# Create a new column with the combined date and time
datetime = strptime(paste(newData$Date, newData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower = as.numeric(newData$Global_active_power)
globalReactivePower  = as.numeric(newData$Global_reactive_power)
voltage = as.numeric(newData$Voltage)
subMetering1 = as.numeric(newData$Sub_metering_1)
subMetering2 = as.numeric(newData$Sub_metering_2)
subMetering3 = as.numeric(newData$Sub_metering_3)

png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

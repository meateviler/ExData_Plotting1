#Read data
filename = "household_power_consumption.txt"
data = read.table(filename,header = TRUE,sep = ";",stringsAsFactors=FALSE,na = "?",dec=".")
# we just need those 2 days
newData = data[data$Date =="1/2/2007"|data$Date =="2/2/2007",]

# Create a new column with the combined date and time
datetime = strptime(paste(newData$Date, newData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower = as.numeric(newData$Global_active_power)

png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

#Read data
filename = "household_power_consumption.txt"
data = read.table(filename,header = TRUE,sep = ";",stringsAsFactors=FALSE,na = "?")
newData = data[data$Date =="1/2/2007"|data$Date =="2/2/2007",]
png("plot1.png")
hist(newData$Global_active_power, 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power",
     col = "red")
dev.off()
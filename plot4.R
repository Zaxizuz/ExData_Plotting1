#Download data and and unzip.

if (!file.exists("exdata%2Fdata%2Fhousehold_power_consumption.zip")){
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileURL,"exdata%2Fdata%2Fhousehold_power_consumption",method="curl")
        unzip("exdata%2Fdata%2Fhousehold_power_consumption.zip")
} 

## Loading data from txt

consumption <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings ="?" )
consumption$Date <-as.Date(consumption$Date, " %d / %m / %Y")
consumption <-subset(consumption,Date=="2007-02-01"|Date=="2007-02-02")

## creating Plot 4

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
timing <-as.POSIXct(paste(consumption$Date, consumption$Time), format="%Y-%m-%d %H:%M:%S")
plot(timing,consumption$Global_active_power,type="l",xlab="",ylab="Global Active Power")
plot(timing,consumption$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(timing,consumption$Sub_metering_1,type="l",xlab="",col="black",ylab="Energy sub metering")
lines(timing,consumption$Sub_metering_2,type="l",col="red")
lines(timing,consumption$Sub_metering_3,type="l",col="blue")
legend("topright",pch=NA,col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lwd=2,cex=0.5)
plot(timing,consumption$Global_reactive_power,type="l",xlab="datetime",ylab="Global Reactive Power")
dev.copy(png, file = "plot4.png",width=480, height=480)
dev.off()

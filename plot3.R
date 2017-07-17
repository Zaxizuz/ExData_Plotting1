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

## creating Plot 3

plot(timing,consumption$Sub_metering_1,type="l",xlab="",col="black",ylab="Energy sub metering")
lines(timing,consumption$Sub_metering_2,type="l",col="red")
lines(timing,consumption$Sub_metering_3,type="l",col="blue")
legend("topright",pch=NA,col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lwd=2)
dev.copy(png, file = "plot3.png",width=480, height=480)
dev.off()
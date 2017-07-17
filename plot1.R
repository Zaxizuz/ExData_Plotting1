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

## creating Plot1

hist(as.numeric(consumption$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.copy(png, file = "plot1.png",width=480, height=480)
dev.off()
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

## creating Plot 2


timing <-as.POSIXct(paste(consumption$Date, consumption$Time), format="%Y-%m-%d %H:%M:%S")
plot(timing,consumption$Global_active_power,type="l",ylab="Global Active Power(kilowatts)",xlab="")
dev.copy(png, file = "plot2.png",width=480, height=480)
dev.off()
library(data.table)

#loading and reading data
setwd("A:/Coursera DS/Exploratory Data Analysis")
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
path <- getwd()
download.file(url, file.path(path, "dta.zip"))
unzip(zipfile = "dta.zip")
dtaFile <- fread(file.path(paste0(path, "/household_power_consumption.txt")))


#subsetting data
dtaFile$Date <- as.Date(dtaFile$Date, format = "%d/%m/%Y")
subDta <- dtaFile[dtaFile$Date == (as.Date("2007-02-01")) | dtaFile$Date == (as.Date("2007-02-02"))]               
View(subDta)

#plot1.png
png(file= paste0(path,"/plot1.png"),
    width=480, height=480)
hist(as.numeric(subDta$Global_active_power), col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()

#plot2.png
subDta$dateTime <- as.POSIXct(paste(subDta$Date, subDta$Time), format = "%Y-%m-%d %H:%M:%S")
png(file= paste0(path,"/plot2.png"),
    width=480, height=480)
plot(subDta$dateTime, subDta$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)" 
     , xlab = "")
dev.off()

#plot3.png
png(file= paste0(path,"/plot3.png"),
    width=480, height=480)
plot(subDta$dateTime, subDta$Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering")
lines(subDta$dateTime, subDta$Sub_metering_2, col = "red" )
lines(subDta$dateTime, subDta$Sub_metering_3, col = "blue" )
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "), lty=c(1,1), lwd=c(1,1))
dev.off()

#plot4.png
png(file= paste0(path,"/plot4.png"),
    width=480, height=480)
par(mfrow=c(2,2))

plot(subDta$dateTime, subDta$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)" 
     , xlab = "")

plot(subDta$dateTime, subDta$Voltage, xlab = "datetime", yalb = "Voltage", type = "l")

plot(subDta$dateTime, subDta$Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering")
lines(subDta$dateTime, subDta$Sub_metering_2, col = "red" )
lines(subDta$dateTime, subDta$Sub_metering_3, col = "blue" )
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "), lty=c(1,1), lwd=c(1,1))

plot(subDta$dateTime, subDta$Global_reactive_power, type = "l", xlab = "datetime")
dev.off()
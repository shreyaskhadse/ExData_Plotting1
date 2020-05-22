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


#plot2.png
subDta$dateTime <- as.POSIXct(paste(subDta$Date, subDta$Time), format = "%Y-%m-%d %H:%M:%S")
png(file= paste0(path,"/plot2.png"),
    width=480, height=480)
plot(subDta$dateTime, subDta$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)"
     , xlab = "")
dev.off()

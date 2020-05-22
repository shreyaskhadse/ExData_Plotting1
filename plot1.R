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

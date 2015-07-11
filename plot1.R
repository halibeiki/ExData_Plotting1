setwd("D:/data analysis/Exploratory Analysis- Project1")

## Full data
dataFull <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?")
dataFull$Date <- as.Date(dataFull$Date, format="%d/%m/%Y")

## Required data
data <- subset(dataFull, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dataFull)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 1
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", ylim= c(0,1200), col="Red")

## Saving to a file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

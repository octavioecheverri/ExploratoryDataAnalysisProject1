##My Local Working Directory is
##C:\Users\Octabio\Dropbox\Especializacion Data Science\Exploratory Analysis\Project1
##setwd("C:\\Users\\Octabio\\Dropbox\\Especializacion Data Science\\Exploratory Analysis\\Project1")

fullfile <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
fullfile$Date <- as.Date(fullfile$Date, format="%d/%m/%Y")

## Subsetting the data
data <- subset(fullfile, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(fullfile)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 1
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

## File closed
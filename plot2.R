fullfile <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
fullfile$Date <- as.Date(fullfile$Date, format="%d/%m/%Y")

## Subsetting the data
data <- subset(fullfile, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(fullfile)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 2
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

## File closed
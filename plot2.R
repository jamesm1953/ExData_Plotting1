## Read file
hpc <- read.csv('household_power_consumption.txt', sep=';', na.strings='?', stringsAsFactors=FALSE)

## Clean up dates and times
hpc$DateTime <- paste(hpc$Date, hpc$Time)
hpc$DateTime <- strptime(hpc$DateTime, '%d/%m/%Y %H:%M:%S')

## Create subset with rows of interest
x <- subset(hpc, DateTime >= '2007-02-01' & DateTime < '2007-02-03')

## Open graphics device
png('plot2.png', height=480, width=480)

## Create Plot 2 - Line graph
plot(x$DateTime, x$Global_active_power, type='l', xlab='', ylab='Global Active Power (kilowatts)')

## Close graphics device
dev.off()

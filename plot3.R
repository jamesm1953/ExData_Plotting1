## Read file
hpc <- read.csv('household_power_consumption.txt', sep=';', na.strings='?', stringsAsFactors=FALSE)

## Clean up dates and times
hpc$DateTime <- paste(hpc$Date, hpc$Time)
hpc$DateTime <- strptime(hpc$DateTime, '%d/%m/%Y %H:%M:%S')

## Create subset with rows of interest
x <- subset(hpc, DateTime >= '2007-02-01' & DateTime < '2007-02-03')

## Open graphics device
png('plot3.png', height=480, width=480)

## Create Plot 3 - Multiple line graph
plot(x$DateTime, x$Sub_metering_1, type='l', ylab='Energy sub metering', xlab='')
lines(x$DateTime, x$Sub_metering_2, type='l', col='red')
lines(x$DateTime, x$Sub_metering_3, type='l', col='blue')
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty=c(1, 1, 1))

## Close graphics device
dev.off()

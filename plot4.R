## Read file
hpc <- read.csv('household_power_consumption.txt', sep=';', na.strings='?', stringsAsFactors=FALSE)

## Clean up dates and times
hpc$DateTime <- paste(hpc$Date, hpc$Time)
hpc$DateTime <- strptime(hpc$DateTime, '%d/%m/%Y %H:%M:%S')

## Create subset with rows of interest
x <- subset(hpc, DateTime >= '2007-02-01' & DateTime < '2007-02-03')

## Open graphics device
png('plot4.png', height=480, width=480)

## Create Plot 4 - Multiple-panel graph
opar <- par(mfrow=c(2,2))
## Plot 1
plot(x$DateTime, x$Global_active_power, type='l', xlab='', ylab='Global Active Power')
## Plot 2
plot(x$DateTime, x$Voltage, type='l', xlab='datetime', ylab='Voltage')
## Plot 3
plot(x$DateTime, x$Sub_metering_1, type='l', ylab='Energy sub metering', xlab='')
lines(x$DateTime, x$Sub_metering_2, type='l', col='red')
lines(x$DateTime, x$Sub_metering_3, type='l', col='blue')
legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty=c(1, 1, 1), bty='n')
## Plot 4
plot(x$DateTime, x$Global_reactive_power, type='l', xlab='datetime', ylab='Global_reactive_power')
par(opar)

## Close graphics device
dev.off()

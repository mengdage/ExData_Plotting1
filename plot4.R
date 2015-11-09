sample <- read.table("household_power_consumption.txt",header=TRUE, sep=";", nrows=5)
cls <- sapply(sample, class)
cls[1] <- "Date"
cls[2] <- "POSIXct"
consumption <- read.table("household_power_consumption.txt",header=TRUE, sep=";", colClasses = cls, na.strings="?")
consumption.complete <- consumption[complete.cases(consumption),]
consumption$Time[1:5]
names(consumption)
twodayConsumption <- consumption.complete[consumption.complete$Date=="2/2/2007" | consumption.complete$Date == "1/2/2007",]
names(twodayConsumption)
twodayConsumption <- twodayConsumption[complete.cases(twodayConsumption),]

par(mfrow=c(2,2))
# plot c(1,1)
numericGAP <- with(twodayConsumption, as.numeric(levels(Global_active_power))[Global_active_power])
plot(numericGAP, xlab="",ylab="Global Active Power", xaxt="n",type='l')
len <- length(numericGAP)
axis(1, at=c(0,len/2, len),labels=c("Thu", "Fri", "Sat"))

# plot c(1,2)
numericV <- with(twodayConsumption, as.numeric(levels(Voltage))[Voltage])
plot(numericV, type="l", xlab="datetime", ylab="Voltage", xaxt = "n")
len <- length(numericV)
axis(1, at=c(0,len/2, len),labels=c("Thu", "Fri", "Sat"))

# plot c(2,1)
numericSM1 <- with(twodayConsumption, as.numeric(levels(Sub_metering_1))[Sub_metering_1])
numericSM2 <- with(twodayConsumption, as.numeric(levels(Sub_metering_2))[Sub_metering_2])
numericSM3 <- twodayConsumption$Sub_metering_3
len <- length(numericSM1)
plot(numericSM1, col="black", type="l", ylab="Energy sub metering",xlab="", xaxt="n")
points(numericSM2, col="red", type="l")
points(numericSM3, col="blue", type="l")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),bty="n", lty=c(1, 1,1), col=c("black", "red", "blue"), cex=0.7)
axis(1, at=c(0, len/2, len), labels=c("Thu", "Fri", "Sat"))

# plot c(2,2)
numericGAR <- with(twodayConsumption, as.numeric(levels(Global_reactive_power))[Global_reactive_power])
plot(numericGAR, xlab="datetime",ylab="Global_reactive_power", xaxt="n",type='l')
len <- length(numericGAR)
axis(1, at=c(0,len/2, len),labels=c("Thu", "Fri", "Sat"))

dev.copy(png, "plot4.png")
dev.off()

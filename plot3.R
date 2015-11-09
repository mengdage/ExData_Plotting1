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

######
numericSM1 <- with(twodayConsumption, as.numeric(levels(Sub_metering_1))[Sub_metering_1])
numericSM2 <- with(twodayConsumption, as.numeric(levels(Sub_metering_2))[Sub_metering_2])
numericSM3 <- twodayConsumption$Sub_metering_3
len <- length(numericSM1)
plot(numericSM1, col="black", type="l", ylab="Energy sub metering",xlab="", xaxt="n")
points(numericSM2, col="red", type="l")
points(numericSM3, col="blue", type="l")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1, 1), col=c("black", "red", "blue"), lwd=c(2.5, 2.5))
axis(1, at=c(0, len/2, len), labels=c("Thu", "Fri", "Sat"))

dev.copy(png, "plot3.png")
dev.off()



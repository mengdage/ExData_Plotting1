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

numericGAP <- with(twodayConsumption, as.numeric(levels(Global_active_power))[Global_active_power])
plot(numericGAP, xlab="",ylab="Global Active Power(kilowattes)", xaxt="n",type='l')
len <- length(numericGAP)
axis(1, at=c(0,len/2, len),labels=c("Thu", "Fri", "Sat"))

dev.copy(png, "plot2.png")
dev.off()
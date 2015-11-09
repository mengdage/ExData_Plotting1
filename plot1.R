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

with(twodayConsumption, hist(as.numeric(levels(Global_active_power))[Global_active_power],
                                        col="red", main="Global Active Power", xlab="Global Active Power(kilowattes)"))
dev.copy(png, "plot1.png")
dev.off()

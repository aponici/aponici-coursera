## Rows that contain February 1, 2007 at 0:00:00 to February 2, 2007 23:59:00 -> 66637 to 69516
## nrows = 69516-66636 = 2880

# Read data from ZIP file for only the two days.
Data <- read.csv(unz("exdata-data-household_power_consumption.zip", "household_power_consumption.txt"), sep=";", na.strings="?", header = TRUE, skip = 66636, nrows = 2880)

## Plot 1
png("plot1.png")

colnames(Data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
hist(Data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")

dev.off ()

## Plot 2
png("plot2.png")

Data$newdate <- with(Data, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))
plot(Data$newdate,Data$Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off ()

## Plot 3
png("plot3.png")

plot(Data$newdate,Data$Sub_metering_1, type = "l", col="black", xlab="", ylab="Energy sub metering")
par(new=T)
plot(Data$newdate,Data$Sub_metering_2, type = "l",axes=F, ylim=c(0,40), col="red", xlab="", ylab="")
par(new=T)
plot(Data$newdate,Data$Sub_metering_3, type = "l",axes=F, ylim=c(0,40), col="blue", xlab="", ylab="")

dev.off ()

# Plot 4
png("plot4.png")

par(mfrow=c(2,2))
plot(Data$newdate,Data$Global_active_power, type = "l", xlab="", ylab="Global Active Power")

plot(Data$newdate,Data$Voltage, type = "l", xlab="datetime", ylab="Voltage")

plot(Data$newdate,Data$Sub_metering_1, type = "l", col="black", xlab="", ylab="Energy sub metering")
par(new=T)
plot(Data$newdate,Data$Sub_metering_2, type = "l",axes=F, ylim=c(0,40), col="red", xlab="", ylab="")
par(new=T)
plot(Data$newdate,Data$Sub_metering_3, type = "l",axes=F, ylim=c(0,40), col="blue", xlab="", ylab="")

plot(Data$newdate,Data$Global_reactive_power, type = "l", xlab="datetime", ylab="Global_reactive_power")

dev.off ()

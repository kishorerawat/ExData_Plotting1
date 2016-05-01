## code for plot4.R

## first set the device to .png file 
png("plot4.png", width=480, height=480, bg="transparent")

## get the data from the power consumption dataset
## load the source from the common .R file "getdata.R"
source("getdata.R")
power_data <- getdata()
  
## convert the Date and Time char columns to Date, Time R classes 
power_data$Time <- strptime(paste(power_data$Date, power_data$Time), "%d/%m/%Y %H:%M:%S")
power_data$Date <- as.Date(power_data$Date, "%d/%m/%Y")


## first define the plotting area with 2 Rows and 2 columns
par(mfrow=c(2,2))

## the first plot is Time vs Global_active_power
plot(power_data$Time, power_data$Global_active_power, type="l", xlab="", ylab="Global Active Power")

## the second plot is Time vs Voltage data
plot(power_data$Time, power_data$Voltage, type="l", xlab="datetime", ylab="Voltage")

## the third plot is Time vs Sub_metering numbers 1,2,3 (similar to plot3)
plot(power_data$Time, power_data$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(power_data$Time, power_data$Sub_metering_2, col="red")
lines(power_data$Time, power_data$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, box.lwd=0)

## the fourth plot is Time vs Global_reactive_power data
## we need lines, so first draw a "blank" plot with type="n"
plot(power_data$Time, power_data$Global_reactive_power, type="n",
     xlab="datetime", ylab="Global_reactive_power")
## now draw the lines 
lines(power_data$Time, power_data$Global_reactive_power)

## close the .png device
dev.off()

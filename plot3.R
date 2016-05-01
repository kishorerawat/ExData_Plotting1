## code for plot3.R

## first set the device to .png file 
png("plot3.png", width=480, height=480, bg="transparent")

## get the data from the power consumption dataset
## load the source from the common .R file "getdata.R"
source("getdata.R")
power_data <- getdata()
  
## convert the Date and Time char columns to Date, Time R classes 
power_data$Time <- strptime(paste(power_data$Date, power_data$Time), "%d/%m/%Y %H:%M:%S")
power_data$Date <- as.Date(power_data$Date, "%d/%m/%Y")

## first plot the Sub_metering_1 data
plot(power_data$Time, power_data$Sub_metering_1, type="l", col="black",
     xlab="", ylab="Energy sub metering")
## then add the lines for Sub_metering_2 data, using col="red" to distinguish
## from the earlier plotted Sub_metering_1 data
lines(power_data$Time, power_data$Sub_metering_2, col="red")
## lastly add the lines for Sub_metering_3 data, using col="blue" to distinguish
## from the earlier plotted Sub_metering_1 data
lines(power_data$Time, power_data$Sub_metering_3, col="blue")
## add the appropriate legend at "topright" corner, specifying the appropriate
## colors and text as per the plotted data
legend("topright",
       col=c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1)

## close the .png device
dev.off()

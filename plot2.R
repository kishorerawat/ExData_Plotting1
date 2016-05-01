## code for plot2.R

## first set the device to .png file 
png("plot2.png", width=480, height=480, bg="transparent")

## get the data from the power consumption dataset
## load the source from the common .R file "getdata.R"
source("getdata.R")
power_data <- getdata()
  
## convert the Date and Time char columns to Date, Time R classes 
power_data$Time <- strptime(paste(power_data$Date, power_data$Time), "%d/%m/%Y %H:%M:%S")
power_data$Date <- as.Date(power_data$Date, "%d/%m/%Y")

## plot the Time on X-axis and the Power consumption on Y-axis, 
## using Type="1" for lines to be drawn in the graph instead of points
plot(power_data$Time, power_data$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")


##close the .png device
dev.off

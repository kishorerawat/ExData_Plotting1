## code for plot1.R

## first set the device to .png file 
png("plot1.png", width=480, height=480, bg="transparent")

## get the data from the power consumption dataset
## load the source from the common .R file "getdata.R"
source("getdata.R")
power_data <- getdata()
  
## plot the histogram, set the appropriate labels and title
hist(power_data$Global_active_power, xlab="Global Active Power (Kilowatts)", ylab="Frequency", col="red", 
     main = "Global Active Power")

##close the .png device
dev.off

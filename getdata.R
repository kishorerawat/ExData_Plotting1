## this common code is used by all the other R sources to read and 
## create the required dataset

getdata <- function() {
  ##read the power consumption data

  pd <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

  ## set the target date range for our dataset

  start_date <- as.Date("2007-02-01")
  end_date <- as.Date("2007-02-02")

  ## create the subset of data for this date range

  pd_new <- subset(pd, as.Date(pd$Date, format="%d/%m/%Y") %in% as.Date(c(start_date, end_date)))

  pd_new
  
}
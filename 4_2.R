setwd("/Users/maulikchaudhary/Desktop/")
library(dplyr)
houseHold <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, 
                        stringsAsFactors = FALSE)
houseHold$Date <- as.Date(houseHold$Date, format = "%d/%m/%Y")

twoDayDataset <- houseHold[houseHold$Date == "2007-02-01" | houseHold$Date == "2007-02-02",]

twoDayDataset$DateTime <- strptime(paste(twoDayDataset$Date, twoDayDataset$Time), 
                                   format = "%Y-%m-%d %H:%M:%S")

with(twoDayDataset, plot(DateTime, Global_active_power, type = "l", xlab = "", 
                         ylab = "Global Active Power(kilowatts)"))

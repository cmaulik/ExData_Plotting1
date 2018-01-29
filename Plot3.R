setwd("/Users/maulikchaudhary/Desktop/")
library(dplyr)
houseHold <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, 
                        stringsAsFactors = FALSE)
houseHold$Date <- as.Date(houseHold$Date, format = "%d/%m/%Y")

twoDayDataset <- houseHold[houseHold$Date == "2007-02-01" | houseHold$Date == "2007-02-02",]

twoDayDataset$DateTime <- strptime(paste(twoDayDataset$Date, twoDayDataset$Time), 
                                   format = "%Y-%m-%d %H:%M:%S")
plot(twoDayDataset$DateTime, twoDayDataset$Sub_metering_1, type = "n", xlab = "",
     ylab = "Energy sub metering")
points(twoDayDataset$DateTime, twoDayDataset$Sub_metering_1, type = "l")
points(twoDayDataset$DateTime, twoDayDataset$Sub_metering_2, type = "l", col = "red")
points(twoDayDataset$DateTime, twoDayDataset$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lwd = 1, cex = 0.7)


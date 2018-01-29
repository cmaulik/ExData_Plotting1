setwd("/Users/maulikchaudhary/Desktop/")
houseHold <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
houseHold$Date <- strptime(houseHold$Date, format = "%d/%m/%Y")
two_days_data <- b[b$Date == "2007-02-01" | b$Date == "2007-02-02", ]
row.names(two_days_data) <-NULL
## First Graph for the Assignment. Global Active Power Histogram
two_days_data$Global_active_power <- as.numeric(two_days_data$Global_active_power)
hist(two_days_data$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

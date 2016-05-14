# load dependencies
# we will use luridate to help get the relevent records
library(lubridate)

# read entire dataset
df <- read.csv(file = "../data/household_power_consumption.txt", sep = ";")

#Convert each column to its correct class
# convert the date and time to date objects using lubridate
df$Date <- dmy(df$Date)
df$Time <- hms(df$Time)
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))
df$Voltage <- as.numeric(as.character(df$Voltage))
df$Global_intensity <- as.numeric(as.character(df$Global_intensity))
df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))

# set boundries for date
fromdate <- ymd("2007-02-01")
todate <- ymd("2007-02-02")

# subset the dataset
sdf <- subset(df, Date >= fromdate & Date <= todate)

# plot 2
with(sdf, plot(Date + Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (killowatts)"))

#copy to png
dev.copy(png, "./Plot2.png")
dev.off()
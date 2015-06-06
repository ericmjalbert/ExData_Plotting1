
## Assuming data file is in working directory
data_all <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, 
                       na.strings = "?")

## Take Date-based subsection of full data set
data <- subset(data_all, Date == "1/2/2007" | Date == "2/2/2007")

## Set margins to give room for labels
par(mar = c(4,4,1,1))

## Set-up 2 x 2 graph structure
par(mfrow = c(2,2))

## Plot1.R graph
plot(data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power",
     xaxt = "n", cex.lab = 0.75)
axis(side = 1, at = c(0, nrow(data)/2, nrow(data)), labels = c("Thu", "Fri", "Sat"))
 
## Plot voltage graph
plot(data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage", xaxt = "n")
axis(side = 1, at = c(0, nrow(data)/2, nrow(data)), labels = c("Thu", "Fri", "Sat"))
 
## Plot2.R graph
plot(data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", 
     xaxt = "n")
lines(1:nrow(data), data$Sub_metering_2, type = "l", col = "red")
lines(1:nrow(data), data$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "Red", "Blue"), lty = c(1,1,1), bty = "n", cex = 0.8,
       xjust = 1, y.intersp = 0.5)
axis(side = 1, at = c(0, nrow(data)/2, nrow(data)), labels = c("Thu", "Fri", "Sat"))

## Plot Global Reactive Power graph
plot(data$Global_reactive_power, type = "l", xlab ="datetime", 
     ylab = "Global_reactive_power", xaxt = "n")
axis(side = 1, at = c(0, nrow(data)/2, nrow(data)), labels = c("Thu", "Fri", "Sat"))
     

## Copy on-screen plot to png file
dev.copy(png, "plot4.png")
dev.off()
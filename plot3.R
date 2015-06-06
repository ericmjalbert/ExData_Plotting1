
## Assuming data file is in working directory
data_all <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, 
                       na.strings = "?")

## Take Date-based subsection of full data set
data <- subset(data_all, Date == "1/2/2007" | Date == "2/2/2007")

## Plot graph
plot(data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", 
     xaxt = "n")
lines(1:nrow(data), data$Sub_metering_2, type = "l", col = "red")
lines(1:nrow(data), data$Sub_metering_3, type = "l", col = "blue")

## Add the legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "Red", "Blue"), lty = c(1,1,1))

## Manually enter labelled x-axis at left, middle, and right of x-axis
axis(side = 1, at = c(0, nrow(data)/2, nrow(data)), labels = c("Thu", "Fri", "Sat"))

## Copy on-screen plot to png file
dev.copy(png, "plot3.png")
dev.off()
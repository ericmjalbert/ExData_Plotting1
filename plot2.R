
## Assuming data file is in working directory
data_all <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, 
                       na.strings = "?")

## Take Date-based subsection of full data set
data <- subset(data_all, Date == "1/2/2007" | Date == "2/2/2007")

## Set margins to give room for labels
par(mar = c(4,5,4,1))

## Plot graph
plot(data$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)", xaxt = "n")

## Manually enter labelled x-axis at left, middle, and right of x-axis
axis(side = 1, at = c(0, nrow(data)/2, nrow(data)), labels = c("Thu", "Fri", "Sat"))

## Copy on-screen plot to png file
dev.copy(png, "plot2.png")
dev.off()

## Assuming data file is in working directory
data_all <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, 
                       na.strings = "?")

## Take Date-based subsection of full data set
data <- subset(data_all, Date == "1/2/2007" | Date == "2/2/2007")

## Plot histogram
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power", axes = FALSE)

## Manually enter exact axis ticks
axis(side = 1, at = c(0, 2, 4, 6))
axis(side = 2, at = c(0, 200, 400, 600, 800, 1000, 1200))

## Copy on-screen plot to png file
dev.copy(png, "plot1.png")
dev.off()
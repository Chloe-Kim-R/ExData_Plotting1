##Load data set 
data <- read.table("household_power_consumption.txt",header=TRUE, sep=";")
sub <- subset(data,Date=="1/2/2007" | Date=="2/2/2007"  )

## Plot 1 
dev.copy(png,"plot1.png", width = 480, height = 480)
sub$Global_active_power <- as.numeric(sub$Global_active_power)
hist(sub$Global_active_power, col="red", xlab="Global Active Power (kilowatt)", main="Global Active Power")
dev.off()




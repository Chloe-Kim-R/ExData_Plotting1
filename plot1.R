##Load data set 
data <- read.table("household_power_consumption.txt",header=TRUE, sep=";",stringAsFactors=FALSE)
sub <- subset(data,Date=="1/2/2007" | Date=="2/2/2007" )
sub[,3:9] <- lapply(sub[,3:9], function(x) as.numeric(as.character(x)))

## Plot 1 
dev.copy(png,"plot1.png", width = 480, height = 480)
sub$Global_active_power <- as.numeric(as.character(sub$Global_active_power))
dev.off()



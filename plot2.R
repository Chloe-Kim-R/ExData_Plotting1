##Load data set 
data <- read.table("household_power_consumption.txt",header=TRUE, sep=";",stringAsFactors=FALSE)
sub <- subset(data,Date=="1/2/2007" | Date=="2/2/2007" )
sub[,3:9] <- lapply(sub[,3:9], function(x) as.numeric(as.character(x)))
sub$Date <-as.Date(sub$Date,"%d/%m/%Y")
dt<- paste(sub$Date,sub$Time)
sub$Time <- strptime(dt,"%Y-%m-%d %H:%M:%S")

## Plot 2
dev.copy(png,"plot2.png", width = 480, height = 480)
plot(sub$Time,sub$Global_active_power,type="l", ylab="Global Active Power(killowatts)",xlab="")
dev.off() 


 
 
 
        
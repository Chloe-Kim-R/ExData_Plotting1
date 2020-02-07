##Load data set 
data <- read.table("household_power_consumption.txt",header=TRUE, sep=";",stringAsFactors=FALSE)
sub <- subset(data,Date=="1/2/2007" | Date=="2/2/2007" )
sub[,3:9] <- lapply(sub[,3:9], function(x) as.numeric(as.character(x)))
sub$Date <-as.Date(sub$Date,"%d/%m/%Y")
dt<- paste(sub$Date,sub$Time)
sub$Time <- strptime(dt,"%Y-%m-%d %H:%M:%S")


## Plot 3
dev.copy(png,"plot3.png", width = 480, height = 480)
plot(sub$Time,sub$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(sub$Time,sub$Sub_metering_2, type="l",col="red")
lines(sub$Time,sub$Sub_metering_3, type="l",col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off() 
 

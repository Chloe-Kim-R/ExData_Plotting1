##Load data set 
data <- read.table("household_power_consumption.txt",header=TRUE, sep=";")
sub <- subset(data,Date=="1/2/2007" | Date=="2/2/2007" )
sub$Global_active_power <- as.numeric(sub$Global_active_power)
sub$Date <-as.Date(sub$Date,"%d/%m/%Y")
dt<- paste(sub$Date,sub$Time)
sub$Time <- strptime(dt,"%Y-%m-%d %H:%M:%S")

##Plot4 
dev.copy(png,"plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
plot(sub$Time,sub$Global_active_power,type="l", ylab="Global Active Power",xlab="")
plot(sub$Time,sub$Voltage,type="l",ylab="Voltage", xlab="datetime")
plot(sub$Time,sub$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(sub$Time,sub$Sub_metering_2, type="l",col="red")
lines(sub$Time,sub$Sub_metering_3, type="l",col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(sub$Time,sub$Global_reactive_power,type="l",ylab="Global_reactive_power", xlab="datetime")
dev.off() 
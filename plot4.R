file<-read.table("household_power_consumption.txt",sep=";",header = T)
power<-file[file$Date %in% c("1/2/2007","2/2/2007"),]

Sub_metering_1<-as.numeric(as.vector(power$Sub_metering_1))
Sub_metering_2<-as.numeric(as.vector(power$Sub_metering_2))
Sub_metering_3<-as.numeric(as.vector(power$Sub_metering_3))
Global_active_power<-as.numeric(as.vector(power$Global_active_power))
Global_reactive_power<-as.numeric(as.vector(power$Global_reactive_power))
Voltage<-as.numeric(as.vector(power$Voltage))

power$Date_and_Time = paste(as.Date(power$Date,format = "%d/%m/%Y"),power$Time)
par(mfrow = c(2,2))
par(mar = c(4,4,1,1))
time<-strptime(power$Date_and_Time,format="%Y-%m-%d %H:%M:%S")

plot(time,Global_active_power,type="l",xlab = "",ylab="Global Active Power (kilowatts)")

plot(time,Voltage,xlab="datetime",ylab="Voltage",type="l")

{
     plot(time,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
     legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,cex=0.5)
     points(time,Sub_metering_1,type="l")
     points(time,Sub_metering_2,type="l",col="red")
     points(time,Sub_metering_3,type="l",col="blue")
}
plot(time,Global_reactive_power,xlab="datetime",type="s")

dev.copy(png,file="plot4.png",width=580,height=480)
dev.off()



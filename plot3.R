file<-read.table("household_power_consumption.txt",sep=";",header = T)
power<-file[file$Date %in% c("1/2/2007","2/2/2007"),]

Sub_metering_1<-as.numeric(as.vector(power$Sub_metering_1))
Sub_metering_2<-as.numeric(as.vector(power$Sub_metering_2))
Sub_metering_3<-as.numeric(as.vector(power$Sub_metering_3))

power$Date_and_Time = paste(as.Date(power$Date,format = "%d/%m/%Y"),power$Time)
time<-strptime(power$Date_and_Time,format="%Y-%m-%d %H:%M:%S")

plot(time,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,cex=0.75)
points(time,Sub_metering_1,type="l")
points(time,Sub_metering_2,type="l",col="red")
points(time,Sub_metering_3,type="l",col="blue")

dev.copy(png,file="plot3.png",width=580,height=480)
dev.off()
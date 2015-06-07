file<-read.table("household_power_consumption.txt",sep=";",header = T)
power<-file[file$Date %in% c("1/2/2007","2/2/2007"),]

Global_active_power<-as.numeric(as.vector(power$Global_active_power))

power$Date_and_Time = paste(as.Date(power$Date,format = "%d/%m/%Y"),power$Time)
plot(strptime(power$Date_and_Time,format="%Y-%m-%d %H:%M:%S"),Global_active_power,type="l",xlab = "",ylab="Global Active Power (kilowatts)")
dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()
file<-read.table("household_power_consumption.txt",sep=";",header = T)
power<-file[file$Date %in% c("1/2/2007","2/2/2007"),]
Global_active_power<-as.numeric(as.vector(power$Global_active_power))

hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()
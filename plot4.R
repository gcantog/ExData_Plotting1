data <- read.table("household_power_consumption.txt",sep = ";",skip = 66637, nrow = 2880)
colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
format<- as.Date(data$Date, "%d/%m/%Y")
DateandTime<- as.POSIXct(paste(format, data$Time), format="%Y-%m-%d %H:%M:%S")
data2<-cbind(DateandTime,data)
data3<- data2[,c("DateandTime","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")]
png(file="plot4.png",width = 480, height = 480)
par(mfrow =c(2,2))
with(data3,{
	plot(DateandTime,Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="l")
	plot(DateandTime,Voltage, ylab="Voltage", xlab="datetime", type="l")
	plot(DateandTime,Sub_metering_1, ylab="Energy sub metering", xlab="", type="l")
		points(data3$DateandTime,data3$Sub_metering_2,type="l",col="red")
		points(data3$DateandTime,data3$Sub_metering_3,type="l",col="blue")
		legend("topright",bty = "n",lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
	plot(DateandTime,Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="l")
	})
dev.off()


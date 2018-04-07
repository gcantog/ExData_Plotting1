data <- read.table("household_power_consumption.txt",sep = ";",skip = 66637, nrow = 2880)
colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
format<- as.Date(data$Date, "%d/%m/%Y")
DateandTime<- as.POSIXct(paste(format, data$Time), format="%Y-%m-%d %H:%M:%S")
data2<-cbind(DateandTime,data)
data3<- data2[,c("DateandTime","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")]
png(file="plot2.png",width = 480, height = 480)
with(data3, plot(DateandTime,Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="l"))
dev.off()


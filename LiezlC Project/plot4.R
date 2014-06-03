rm(list=ls())
data<-read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data$Date<-as.Date(data$Date,format='%d/%m/%Y')
df<-subset(data,data$Date >= "2007-02-01" & data$Date <= "2007-02-02")
datetime<-as.POSIXct(paste(df$Date, df$Time), format="%Y-%m-%d %H:%M:%S")
df$Global_active_power<-as.numeric(as.character(df$Global_active_power))
df$Sub_metering_1<-as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2<-as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3<-as.numeric(as.character(df$Sub_metering_3))
df$Voltage<-as.numeric(as.character(df$Voltage))
df$Global_reactive_power<-as.numeric(as.character(df$Global_reactive_power))


par(mfrow=c(2, 2))

plot(datetime, df$Global_active_power, type = "l",  ylab = "Global Active Power", xlab = "")

plot(datetime, df$Voltage, type = "l",  ylab = "Voltage")

plot(datetime, df$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col = "black", legend = TRUE)
lines(datetime, df$Sub_metering_2,col = "red")
lines(datetime, df$Sub_metering_3,col = "blue")
legend("topright",lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


plot(datetime, df$Global_reactive_power, type = "l",  ylab = "Global_Reactive_Power")

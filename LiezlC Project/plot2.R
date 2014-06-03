rm(list=ls())
data<-read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data$Date<-as.Date(data$Date,format='%d/%m/%Y')
df<-subset(data,data$Date >= "2007-02-01" & data$Date <= "2007-02-02")
datetime<-as.POSIXct(paste(df$Date, df$Time), format="%Y-%m-%d %H:%M:%S")
df$Global_active_power<-as.numeric(as.character(df$Global_active_power))
plot(datetime, df$Global_active_power, type = "l",  ylab = "Global Active Power (kilowatts)", xlab = "")


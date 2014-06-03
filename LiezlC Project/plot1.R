rm(list=ls())
data<-read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data$Date<-as.Date(data$Date,format='%d/%m/%Y')
data$Time<-strptime(data$Time,format='%H:%M:%s')
df<-subset(data,data$Date >= "2007-02-01" & data$Date <= "2007-02-02")
df$Global_active_power<-as.numeric(as.character(df$Global_active_power))
hist(df$Global_active_power, col = "red", main =  "GLobal Active Power", xlab = "Global Active Power (kilowatts)")


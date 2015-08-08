data_set <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
plot_data <- subset(data_set, Date == "1/2/2007"|Date == "2/2/2007")
plot_data <- transform(plot_data,date_time = paste(Date,Time, sep = " "))
plot_data <- transform(plot_data,Date = strptime(Date,"%d/%m/%Y"), Time = strptime(Time, "%H:%M:%S"), date_time = strptime(date_time, "%d/%m/%Y %H:%M:%S"))


png(filename = "plot4.png")
par(mfrow = c(2,2),mar = c(4,2,0,0),pin = c(2.2,2.0), cex = 0.7, cex.lab = 1.2)
with(plot_data,plot(date_time,Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)"))
with(plot_data,plot(date_time,Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))
with(plot_data,plot(date_time, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering"))
with(plot_data,lines(date_time, Sub_metering_2, type = "l", col = "red"))
with(plot_data,lines(date_time, Sub_metering_3, type = "l", col = "blue"))
legend("topright",lty = 1, legend = c("sub_metering_1","sub_metering_2","sub_metering_3"),col= c("black","red","blue"))
with(plot_data,plot(date_time,Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_Power"))

dev.off()
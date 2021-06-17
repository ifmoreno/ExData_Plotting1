datos <- readRDS(file = "datos.rds")

datos$Voltage <- as.numeric(datos$Voltage)
datos$Global_reactive_power <- as.numeric(datos$Global_reactive_power)

png("plot4.png",
    width = 480, height = 480,
    units = "px")
par(mfrow=c(2,2))
with(datos, plot(tiempo, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
with(datos, plot(tiempo, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))
with(datos, plot(tiempo, Sub_metering_1, type = "l", ylab = "Energy sub metering"))
lines(datos$tiempo, datos$Sub_metering_2, col="red")
lines(datos$tiempo, datos$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("black","red","blue"), lty = c(1,1,1))
with(datos, plot(tiempo, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))


par(mfrow=c(1,1))
dev.off()

datos <- readRDS(file = "datos.rds")

datos$Sub_metering_1 <- as.numeric(datos$Sub_metering_1)
datos$Sub_metering_2 <- as.numeric(datos$Sub_metering_2)
datos$Sub_metering_3 <- as.numeric(datos$Sub_metering_3)

png("plot3.png",
    width = 480, height = 480,
    units = "px")
with(datos, plot(tiempo, Sub_metering_1, type = "l", ylab = "Energy sub metering"))
lines(datos$tiempo, datos$Sub_metering_2, col="red")
lines(datos$tiempo, datos$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("black","red","blue"), lty = c(1,1,1))
dev.off()

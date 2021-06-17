datos <- readRDS(file = "datos.rds")

png("plot2.png", 
    width = 480, height = 480,
    units = "px")
with(datos, plot(tiempo, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()

datos$Sub_metering_1 <- as.numeric(datos$Sub_metering_1)
datos$Sub_metering_2 <- as.numeric(datos$Sub_metering_2)
datos$Sub_metering_3 <- as.numeric(datos$Sub_metering_3)
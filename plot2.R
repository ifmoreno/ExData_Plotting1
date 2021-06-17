datos <- readRDS(file = "datos.rds")

png("plot2.png", 
    width = 480, height = 480,
    units = "px")
with(datos, plot(tiempo, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()


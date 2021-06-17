

url <- "https://d396qusza40orc.cloudatosront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
camino <- getwd()
download.file(url, file.path(camino, "datos.zip"))
unzip(zipfile = "datos.zip")

# actividades y variables
list.files()[4]

datos <- read.table(file="household_power_consumption.txt", sep = ";", header = T, na.strings = "?")
datos$Date <- as.Date(datos$Date, "%d/%m/%Y")
datos <- datos[datos$Date >= "2007-02-01" & datos$Date <= "2007-02-02",]
datos$tiempo <- paste0(datos$Date," ", datos$Time)
datos$tiempo <- strptime(datos$tiempo, format = "%Y-%m-%d %H:%M:%S")
datos$Global_active_power <- as.numeric(datos$Global_active_power)

saveRDS(datos, file = "datos.rds")

datos <- readRDS(file = "datos.rds")
png("plot1.png", 
    width = 480, height = 480,
    units = "px")
hist(datos$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", 
     col = "red")
dev.off()

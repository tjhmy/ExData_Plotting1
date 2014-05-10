setwd("/Users/marwasalem/Exploratory R")

require(data.table)
suppressWarnings(myfile <- fread("household_power_consumption.txt", sep = ";", header = TRUE, colClasses = "character"))
myfile2 <- as.data.frame(myfile[(Date == "1/2/2007" | Date == "2/2/2007"), ])
myfile2[, 3:9] <- as.numeric(unlist(myfile2[, 3:9]))
myfile2$datetime <- strptime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")

attach(myfile2)

png("plot3.png",  width = 480, height = 480)

plot3 <- plot(Sub_metering_1, col = "black", xlab = "", ylab = "Energy sub metering", axes = FALSE, type = "l")
box()
ticks <- c(1, 1440, 2880)
axis(side = 1, at = ticks, labels = c("Thursday", "Friday", "Saturday"))
axis(side = 2)
lines(Sub_metering_2, type = "l", col = "red")
lines(Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1,1,1))

dev.off()

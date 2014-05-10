setwd("/Users/marwasalem/Exploratory R")

require(data.table)
suppressWarnings(myfile <- fread("household_power_consumption.txt", sep = ";", header = TRUE, colClasses = "character"))
myfile2 <- as.data.frame(myfile[(Date == "1/2/2007" | Date == "2/2/2007"), ])
myfile2[, 3:9] <- as.numeric(unlist(myfile2[, 3:9]))
myfile2$datetime <- strptime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")

attach(myfile2)

png("plot2.png",  width = 480, height = 480)

plot2 <- plot(Global_active_power, type = "l", axes = FALSE, xlab = "", ylab = "Global Active Power (kilowatts)")
box()
ticks <- c(1, 1440, 2880)
axis(side = 1, at = ticks, labels = c("Thursday", "Friday", "Saturday"))
axis(side = 2)

dev.off()
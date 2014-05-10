setwd("/Users/marwasalem/Exploratory R")

require(data.table)
suppressWarnings(myfile <- fread("household_power_consumption.txt", sep = ";", header = TRUE, colClasses = "character"))
myfile2 <- as.data.frame(myfile[(Date == "1/2/2007" | Date == "2/2/2007"), ])
myfile2[, 3:9] <- as.numeric(unlist(myfile2[, 3:9]))
myfile2$datetime <- strptime(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")

attach(myfile2)

png("plot1.png",  width = 480, height = 480)

plot1 <- hist(Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off()

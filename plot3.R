## Plot #3


## To read in the data, this assumes the file is in your working directory
data <- read.csv2("household_power_consumption.txt", stringsAsFactors = FALSE)
# YOU NEED TO INCLUDE STRINGSASFACTORS=FALSE OR ELSE YOU MESS UP
data1 <- data[data$Date=="1/2/2007",]
data2 <- data[data$Date=="2/2/2007",]
data3 <- rbind(data1,data2)

for (i in 1:nrow(data3)) {
     data3[i,10] <- paste(data3[i,1],data3[i,2])
}
data3$V10<-strptime(data3$V10, format = "%d/%m/%Y %H:%M:%S")


## Now to actual create the plot
png("plot3.png", width = 480, height = 480)

plot(data3$V10, data3$Sub_metering_1, xlab ="", ylab ="Energy sub metering", type="n")
lines(data3$V10, data3$Sub_metering_1)
lines(data3$V10, data3$Sub_metering_2, col = "red")
lines(data3$V10, data3$Sub_metering_3, col = "blue")
legend("topright", pch = "-", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##and to export as png
dev.off()
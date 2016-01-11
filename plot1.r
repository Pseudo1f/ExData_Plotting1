## Plot #1


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
data3$Global_active_power <- as.numeric(data3$Global_active_power)
hist(data3$Global_active_power, xlab = "Global Active Power (kilowatts)", 
     col="red", main="Global Active Power")

#and to export as png
dev.copy(png, "plot1.png", width=480, height=480)
dev.off()
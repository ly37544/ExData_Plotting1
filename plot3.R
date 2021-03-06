data <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,colClasses = "character")
data2 <- subset(data,Date == "1/2/2007" | Date == "2/2/2007",select = Date:Sub_metering_3)
time <- paste(data2[,1],data2[,2],sep = " ")
time <- strptime(time,"%d/%m/%Y %H:%M:%S",tz = "GMT")
data3 <- cbind(time,data2[,-c(1,2)])
with(data3,plot(time,as.numeric(Sub_metering_1),type = "l",ylab = "Energy sub metering",xlab = ""))
with(data3,lines(time,as.numeric(Sub_metering_2),col = "red"))
with(data3,lines(time,as.numeric(Sub_metering_3),col = "blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col = c("black","red","blue"),bty = "n")
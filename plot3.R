#Week 1
#Quiz

Sys.setlocale("LC_ALL", 'en_US.UTF-8')
#Read dataframe
powerData<-read.csv(file = "./household_power_consumption.txt", sep = ";", header = TRUE)

#Convert date and time variable
powerData$DateTime<-paste(powerData$Date, powerData$Time)
powerData$DateTime<-strptime(powerData$DateTime, format = "%d/%m/%Y %H:%M:%S")
powerData$Date<-as.Date(powerData$Date, format = "%d/%m/%Y")
#Subset data to 1.-2.2.2007
powerSubData <- subset(powerData, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#Third plot Global Active Power per date
png(filename = "plot3.png",width = 480, height = 480)
par(mfcol = c(1,1))
powerSubData$Sub_metering_1<-as.numeric(as.character(powerSubData$Sub_metering_1))
powerSubData$Sub_metering_2<-as.numeric(as.character(powerSubData$Sub_metering_2))
powerSubData$Sub_metering_3<-as.numeric(as.character(powerSubData$Sub_metering_3))
plot(powerSubData$DateTime, powerSubData$Sub_metering_1, main = NULL, xlab= "", ylab = "Energy sub metering", type = "l")
lines(powerSubData$DateTime, powerSubData$Sub_metering_2, col = "red")
lines(powerSubData$DateTime, powerSubData$Sub_metering_3, col = "blue")
legend("topright", lty=1, col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
dev.off()

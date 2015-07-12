#Week 1
#Quiz

#Read dataframe
powerData<-read.csv(file = "./household_power_consumption.txt", sep = ";", header = TRUE)

#Convert date and time variable

powerData$DateTime<-paste(powerData$Date, powerData$Time)
powerData$DateTime<-strptime(powerData$DateTime, format = "%d/%m/%Y %H:%M:%S")
str(powerData$DateTime)
powerData$Date<-as.Date(powerData$Date, format = "%d/%m/%Y")

#Subset data to 1.-2.2.2007
powerSubData <- subset(powerData, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#First plot Global Active Power
png(filename = "plot1.png",width = 480, height = 480)
par(mfcol = c(1,1))
powerSubData$Global_active_power<-as.numeric(as.character(powerSubData$Global_active_power))
hist(powerSubData$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

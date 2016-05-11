#set working directory
setwd("Desktop")
# upload txt file, columns are seperated by ";", decimals = ".", and stringsAsFactors = False
UCI <- read.table("household_power_consumption-2.txt", header=T, sep = ";", dec=".", stringsAsFactors = F)
#select the date range 1/2/2007:2/2/2007
subsetUCI<-UCI[UCI$Date %in% c("1/2/2007","2/2/2007") ,]
#Global_Active_Power is a charector and must be converted to a numeric
Global_Active_Power<- as.numeric(subsetUCI$Global_active_power)
#Submetering 1,2,3 is converted to a numeric
Submtering1<- as.numeric(subsetUCI$Sub_metering_1)
Submetering2<- as.numeric(subsetUCI$Sub_metering_2)
Submetering3<- as.numeric(subsetUCI$Sub_metering_3)
#Global_Active_Power is a charector and must be converted to a numeric
Global_Reactive_Power<-as.numeric(subsetUCI$Global_reactive_power)
#Voltage is a charector and must be converted to a numeric
Voltage<-as.numeric(subsetUCI$Voltage)
#Create and save the plots, use par(mfrow) to display 2 rows and 2 columns
png(filename = "Plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
plot(strpUCIsubset, Global_Active_Power,type="l", ylab="Global Active Power", cex=0.2)
plot(strpUCIsubset, Voltage, type="l", ylab = "voltage", xlab = "datetime")
plot(strpUCIsubset, Submtering1,type="l", ylab="Sub Metering")
lines(strpUCIsubset, Submetering2, type="l", col="red")
lines(strpUCIsubset, Submetering3, type="l", col="blue")
legend("topright", c("Submetering_1", "Submetering_2", "Submetering_3"), lty=1, lwd=2, col= c("black","red","blue"))
plot(strpUCIsubset, Global_Reactive_Power, type="l", xlab="Date time", ylab="Global Reactive Power")
dev.off()

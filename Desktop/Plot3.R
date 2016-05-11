#set working directory
setwd("Desktop")
# upload txt file, columns are seperated by ";", decimals = ".", and stringsAsFactors = False
UCI <- read.table("household_power_consumption-2.txt", header=T, sep = ";", dec=".", stringsAsFactors = F)
#Inspect data
head(UCI)
#check dimensions
dim(UCI)
#select the date range 1/2/2007:2/2/2007
subsetUCI<-UCI[UCI$Date %in% c("1/2/2007","2/2/2007") ,]
#inspect vector
head(subsetUCI, 5)
#convert the class of Date and Time to "POSIXlt" "POSIXt" formats. 
strpUCIsubset <-strptime(paste(subsetUCI$Date, subsetUCI$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
#Global_Active_Power is a charector and must be converted to a numeric
Global_Active_Power<- as.numeric(subsetUCI$Global_active_power)
#Submetering 1,2,3 is converted to a numeric
Submtering1<- as.numeric(subsetUCI$Sub_metering_1)
Submetering2<- as.numeric(subsetUCI$Sub_metering_2)
Submetering3<- as.numeric(subsetUCI$Sub_metering_3)
#Create and save plot. 
png(filename = "Plot3.png", width=480, height = 480)
plot(strpUCIsubset, Submtering1,type="l", ylab="Sub Metering")
lines(strpUCIsubset, Submetering2, type="l", col="red")
lines(strpUCIsubset, Submetering3, type="l", col="blue")
legend("topright", c("Submetering_1", "Submetering_2", "Submetering_3"), lty=1, lwd=2, col= c("black","red","blue"))
dev.off()
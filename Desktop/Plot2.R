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
#Create and store plot
png(filename = "Plot2.png", width = 480, height = 480)
plot(strpUCIsubset, Global_Active_Power,type="l", ylab="Global Active Power (Kilowatts)")
dev.off()


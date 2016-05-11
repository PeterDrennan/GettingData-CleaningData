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
#Global_Active_Power is a charector and must be converted to a numeric
Global_Active_Power<- as.numeric(subsetUCI$Global_active_power)
#plot and save
png(filename = "Plot1.png",
    width = 480, height = 480)
hist(Global_Active_Power, col="red", main ="Global Active Power", xlab= "Global Avctive Power (Kilowatts)")
dev.off()





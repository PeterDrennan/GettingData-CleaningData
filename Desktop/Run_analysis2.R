y_test  <- read.table("y_test.txt", header = FALSE)
y_train <- read.table("y_train.txt", header = FALSE)
subject_train <- read.table("subject_train.txt", header = FALSE)
subject_test  <- read.table("subject_test.txt", header = FALSE)
x_test <- read.table("X_test.txt",header = FALSE)
x_train <- read.table("X_train.txt",header = FALSE)
## load y_test, y_train, subject_train, x_test, & x_train data into r using
## read.table command
subjectbind <- rbind(subject_test, subject_train)
## use rbind to combine subject_test and subject_train datasets
activitybind<- rbind(y_train, y_test)
## use rind to combine y_train and y_test datasets
featuresbind<- rbind(x_train, x_test)
## use rbind to combine x_train, and x_test
names(subjectbind) <-c("subject")
## name the columns in subjectbind as "subject"
names(activitybind)<- c("activity")
## name the columns in activitybind as "activity"
dataFeaturesNames <- read.table("features.txt",header = FALSE)
##load features dataset into R using read.table command
names(featuresbind)<- dataFeaturesNames$V2
## names in featurebind are the same as those present in V2 of the dataset dataFeatueNames
combined <- cbind(subjectbind, activitybind)
##use cbind to combine the subjectbind and activitybind
Data <- cbind(featuresbind, combined)
## use cbind to combine featuresbind and combined
subdataFeaturesNames<-dataFeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", dataFeaturesNames$V2)]
## isolate the mean and std using grep
selectedNames<-c(as.character(subdataFeaturesNames), "subject", "activity" )
Data<-subset(Data,select = selectedNames)
activitylabels <- read.table("activity_labels.txt", header = FALSE)
## read activity labels into R using read.table command
Datafactor <- factor(Data$activity)
##factorize Data activity
names(Data) <- gsub("\\[|\\]", "", names(Data))
names(Data) <- gsub("-", "_", names(Data))
names(Data) <- gsub("mean", "Mean", names(Data))
names(Data) <- gsub("std", "Standard Dev", names(Data))
names(Data) <- gsub("Acc", "Accelerometer", names(Data))
names(Data) <- gsub("Gyro", "Gyroscope", names(Data))
names(Data) <- gsub("subject", "Subject", names(Data))
names(Data) <- gsub("activity", "Activity", names(Data))
names(Data) <- gsub("[(][)]", "", names(Data))
## using gsub remove [], -, mean, std, Acc, Gyro, () and replace with easier to read values
## also use upper case instead of lower case. 
library(plyr)
Data2<-aggregate(. ~Subject + Activity, Data, mean)
## aggregate data by Subject, and Activity and their means
Data2 <- Data2[order(Data2$Subject, Data2$Activity),]
##order the data
write.table(Data2, file= "Tidy Dataset.txt")
## write into a tidy data set. 


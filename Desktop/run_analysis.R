
subjecttest <- read.table("subject_test.txt")
## read in the subject test file name it subjecttest
Xtest <- read.table("X_test.txt")
## read in y test file name it Xtest
Ytest <- read.table("y_test.txt")
## read in y test file name it Ytest
subjecttrain <- read.table("subject_train.txt")
## read in subject train file name it subjecttrain
Xtrain <- read.table("X_train.txt")
## read in x train file name it Xtrain
Ytrain <- read.table("y_train.txt")
## read in y train file name it Ytrain
features <- read.table("features.txt", col.names = c("featureID", "featureLabel"))
## create features vector which reads in the features file with column names featureID and 
## featureLabel
activities <- read.table("activity_labels.txt", col.names=c("activityId", "activityLabel"))
## read in activity lables file, and name columns activityId and activityLebl, name it 
##activities
activities.activityLabel <- gsub("_", "", as.character(activities$activityLabel))
##use gsub to transfrom activities$activityLabel into a charecter name it 
##activities.activityLabel
newFeatures <- grep("-mean\\(\\)|-std\\(\\)", features$featureLabel)
## use grep to isolate the mean and standard deviatioon, name it newFeatures
subjectbind <-rbind(subjecttest, subjecttrain)
## use rbind to merge subjecttest and subjecttrain name it subjectbind
names(subjectbind) <- "subjectId"
## add subjectId as name 
head(names(subjectbind))
X <- rbind(Xtest, Xtrain)
## use rbind to merge Xtest and Xtrain, name it X
X <- X[, newFeatures]
## subset X, in its rows with the data from newFeatures
names(X) <- gsub("\\(|\\)", "", features$featureLabel[newFeatures])
Y <- rbind(Ytest, Ytrain)
## use rbind to merge Ytest, and Ytrain, name it Y
names(Y) = "activityId"
activity <- merge(Y, activities, by="activityId")$activityLabel
## use merge to merge(funnily enough) Y and activities by the activityId in activityLabel
data <- cbind(subjectbind, X, activity)
##use cbind to merge the columns subjectbind, X, and activity.
write.table(data, "tidydata.txt")
library(data.table)
## access data.table package
Datatable.1 <-data.table(data)
calculatedData<- Datatable.1[, lapply(.SD, mean), by=c("subjectId", "activity")]
## subset Datatable with an lapply function on standard deviation, and means in the columns subjectId
## and activity
write.table(calculatedData, "final.tidy.data.txt")
##write the table to your working directory


 



## Code Book for week 4 Cleaning Data Assignment
This repo contains tidied, cleaned, and transformed data from a study completed
on fitness trackers used on Samsung S phones. 
This is a new frontier in technology that is already quite lucrative.
Full details of the Human Activity Recognition Using Smartphones Data Set is available online 
at this link - [HARUSDS](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

### Brief study outline
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

###Assignment Specifics
*Merges the training and the test sets to create one data set.

*Extracts only the measurements on the mean and standard deviation for each measurement.

*Uses descriptive activity names to name the activities in the data set

*Appropriately labels the data set with descriptive variable names.

*Build a tidy data set with the mean of each variable for each activity and each subject.

## Technical Details

*Use the following packages in R - data.table.

##Variables

###SubjectID = the 30 participants of the study
###Activities
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag










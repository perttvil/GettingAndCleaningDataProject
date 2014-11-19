#run_analyris.r

## Usage
In R console, type the following command

source('run_analysis.R')

## What it does

run_analysis.r script downloads a zip file from 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip' 
and extracts it to extract folder.

Then it reads multiple measurement txt text files.

### phase 1
it reads measurement names to variable featureNames

### phase 2
it reads activity codebook to variable activityTable

### phase 3
Then it reads training data x_train.txt which contains training data measurements and combines it with subject_train.txt which contains the subject id for the measurement and then it combines it with y_train.txt which contains the activity id, what the subject was doing while the measurement was taken. And then it adds activity name to the data based on the name given for activity id in activityTable

### phase 4
It reads the same information for test data

### phase 5
It merges test and train data to variable data

### phase 6
It filters out all other columns than mean, std, subject and activity and calculates the mean of all the measurements left by every subject for every activity.

### phase 7
then it writes the result to file 'tidydataset.txt'

## Result data set

###naming conventions:
measurement values in tidy data set are calculated averages from multiple measurements. Original measurements
very mean value and standard deviation value.

###tidydata set contains following columns.
SUBJECT (subject id)
ACTIVITY (activity name)

(all following columns are calculated averages by subject and activity from original measurements)

tBodyAcc-mean()-X 
tBodyAcc-mean()-Y
tBodyAcc-mean()-Z
tBodyAcc-std()-X
tBodyAcc-std()-Y
tBodyAcc-std()-Z
tGravityAcc-mean()-X
tGravityAcc-mean()-Y
tGravityAcc-mean()-Z
tGravityAcc-std()-X
tGravityAcc-std()-Y
tGravityAcc-std()-Z
tBodyAccJerk-mean()-X
tBodyAccJerk-mean()-Y
tBodyAccJerk-mean()-Z
tBodyAccJerk-std()-X
tBodyAccJerk-std()-Y
tBodyAccJerk-std()-Z
tBodyGyro-mean()-X
tBodyGyro-mean()-Y
tBodyGyro-mean()-Z
tBodyGyro-std()-X
tBodyGyro-std()-Y
tBodyGyro-std()-Z
tBodyGyroJerk-mean()-X
tBodyGyroJerk-mean()-Y
tBodyGyroJerk-mean()-Z
tBodyGyroJerk-std()-X
tBodyGyroJerk-std()-Y
tBodyGyroJerk-std()-Z
tBodyAccMag-mean()
tBodyAccMag-std()
tGravityAccMag-mean()
tGravityAccMag-std()
tBodyAccJerkMag-mean()
tBodyAccJerkMag-std()
tBodyGyroMag-mean()
tBodyGyroMag-std()
tBodyGyroJerkMag-mean()
tBodyGyroJerkMag-std()
fBodyAcc-mean()-X
fBodyAcc-mean()-Y
fBodyAcc-mean()-Z
fBodyAcc-std()-X
fBodyAcc-std()-Y
fBodyAcc-std()-Z
fBodyAccJerk-mean()-X
fBodyAccJerk-mean()-Y
fBodyAccJerk-mean()-Z
fBodyAccJerk-std()-X
fBodyAccJerk-std()-Y
fBodyAccJerk-std()-Z
fBodyGyro-mean()-X
fBodyGyro-mean()-Y
fBodyGyro-mean()-Z
fBodyGyro-std()-X
fBodyGyro-std()-Y
fBodyGyro-std()-Z
fBodyAccMag-mean()
fBodyAccMag-std()
fBodyBodyAccJerkMag-mean()
fBodyBodyAccJerkMag-std()
fBodyBodyGyroMag-mean()
fBodyBodyGyroMag-std()
fBodyBodyGyroJerkMag-mean()
fBodyBodyGyroJerkMag-std()
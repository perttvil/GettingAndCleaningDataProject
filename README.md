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

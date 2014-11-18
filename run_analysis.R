library(data.table)
## Initial

# Load zip
zipFilename = "data.zip"
if(!file.exists(zipFilename)) {
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", zipFilename, mode = "wb")
}
# Unzip
extractedDir = "extracted"
if(!file.exists(extractedDir)) {
  unzip(zipFilename, exdir=extractedDir)
}

# read feature names
featureTable <- read.table("extracted/UCI HAR Dataset/features.txt", col.names=c("FEATURE_ID", "FEATURE"), row.names=NULL)
featureNames <- featureTable$FEATURE

# read activities
activityTable <- as.data.table(read.table("extracted/UCI HAR Dataset/activity_labels.txt", col.names=c("ACTIVITY_ID", "ACTIVITY"), row.names=NULL, colClasses = c("numeric", "character")))

# read train data
trainSubject <- as.data.table(read.table("extracted/UCI HAR Dataset/train/subject_train.txt", col.names=c("SUBJECT"), row.names=NULL, colClasses = c("numeric")))
trainActivity <- as.data.table(read.table("extracted/UCI HAR Dataset/train/y_train.txt", col.names=c("ACTIVITY_ID"), row.names=NULL, colClasses = c("numeric")))
trainData <- as.data.table(read.table("extracted/UCI HAR Dataset/train/x_train.txt", col.names=featureNames, row.names=NULL))

# Add subject to train data
trainData$SUBJECT <- trainSubject[,1]
# add activities to train data
trainActivitiesTable <- trainActivity[,ACTIVITY := activityTable[ACTIVITY_ID,2]]

print(trainActivity[1:30,])
print(trainActivitiesTable[1:30,])

#read test data
testSubject <- as.data.table(read.table("extracted/UCI HAR Dataset/test/subject_test.txt", col.names=c("SUBJECT"), row.names=NULL, colClasses = c("numeric")))
testActivity <- as.data.table(read.table("extracted/UCI HAR Dataset/test/y_test.txt", col.names=c("ACTIVITY_ID"), row.names=NULL, colClasses = c("numeric")))
testData <- as.data.table(read.table("extracted/UCI HAR Dataset/test/x_test.txt", col.names=featureNames, row.names=NULL))
# add subject to test data
testData$SUBJECT <- testSubject[,1]
# add activity to test data
testActivitiesTable <- testActivity[,ACTIVITY := activityTable[ACTIVITY_ID,2]]

# Merge test and train data
data <- rbind(testData,trainData)

# Filter columns by name
columns <- which(grepl( "mean|std|ACTIVITY|SUBJECT", names(data)))
filteredData <- data[, columns]

dataTable <- as.data.table(filteredData)
print(dataTable$SUBJECT[1:302])
print(testActivity[1:302,])
print(dataTable$ACTIVITY[1:302])
tidyDataSet <- dataTable[, lapply(.SD,mean), by=c("SUBJECT", "ACTIVITY")]

write.table(tidyDataSet, "tidydataset.txt", row.names=FALSE)


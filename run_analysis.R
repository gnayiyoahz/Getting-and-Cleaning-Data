## ===============================================================================================
## ====================================== Downloading Data =======================================

fileName <- "UCIdata.zip"
url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dir <- "UCI HAR Dataset"

if (!file.exists(fileName)) {
  download.file(url,fileName, mode = "wb") 
}
if (!file.exists(dir)) {
  unzip("UCIdata.zip", files = NULL, exdir=".")
}

## ===============================================================================================
## ===============================================================================================





## ===============================================================================================
## ======================================== Reading Data =========================================

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")  

## ===============================================================================================
## ===============================================================================================





## ===============================================================================================
## ======================================= Analyzing Data ========================================

# 1. Merge the training and the test sets to create one data set.
data <- rbind(X_train, X_test)

# 2. Extract only the measurements on the mean and standard deviation for each measurement.
mean_std <- grepl("mean\\(\\)|std\\(\\)", features[, 2])
data <- data[, mean_std]

# 4. Appropriately labels the data set with descriptive variable names.
feature_names <- sapply(features[, 2], function(x) {gsub("[()]", "", x)})
names(data) <- feature_names[mean_std]

# Combine all data
subject <- rbind(subject_train, subject_test)
names(subject) <- "subject"
activity <- rbind(y_train, y_test)
names(activity) <- "activity"
data <- cbind(subject, activity, data)

# 3. Use descriptive activity names to name the activities in the data set
data$activity <- activity_labels$V2[match(data$activity,activity_labels$V1)]

## ===============================================================================================
## ===============================================================================================





## ===============================================================================================
## ==================================== Obtaining Tidy Data ======================================

# 5. Create a second, independent tidy data set with the average of 
#   each variable for each activity and each subject.
# Use the reshape2 package
if (!"reshape2" %in% installed.packages()) {
  install.packages("reshape2")
}
library("reshape2")

data_edit <- melt(data, (id.vars=c("subject","activity")))
final <- dcast(data_edit, subject + activity ~ variable, mean)
names(final)[-c(1:2)] <- paste("mean of: ", names(final)[-c(1:2)])
write.csv(final, "tidy_data.csv",row.names=FALSE)
# the final dataset is in "tidy_data.csv"

## ===============================================================================================
## ===============================================================================================

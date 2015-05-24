# Getting and Cleaning Data -- Coursera
# Course Project

library(tidyr)
library(dplyr)

# Read data in

# A 561-feature vector with time and frequency domain variables.
test <- read.table("test/X_test.txt", colClasses = "numeric")
testLabels <- read.table("test/y_test.txt", col.names = "ActivityID")

train <- read.table("train/X_train.txt", colClasses = "numeric")
trainLabels <- read.table("train/y_train.txt", col.names = "ActivityID")
trainSubject <- read.table("train/subject_train.txt", col.names = "subjectID")

activityLabels <- read.table("activity_labels.txt", col.names = c("ActivityID", "Activity"))

# Ignore inertial signal folder as the data is not needed.

test <- cbind(test, testLabels)
train <- cbind(train, trainLabels, trainSubject)

# Need to merge the training and test sets.
dat <- bind_rows(test, train)

# Attach descriptive activity names to data set.
dat <- inner_join(dat, activityLabels)

# Of the 561 variables (columns), find which ones are to do with the mean and standard deviation. This information is found in the "features" variable.
features <- read.table("features.txt", col.names = c("featureID", "name"))
measureStat <- grep("mean|std", features$name)

# Only need these mean/stdev values:
dat <- select(dat, measureStat, subjectID:Activity)

# Appropriately labels the data set with descriptive variable names:
names(dat)[1:length(measureStat)] <- as.character(features$name[measureStat])

# Create a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy_dat <- dat %>% group_by(Activity, subjectID) %>% summarise_each(funs(mean)) %>% filter(!is.na(subjectID))

# Write data to text file
# write.table(tidy_dat, "tidy_dat.txt", row.name = FALSE)

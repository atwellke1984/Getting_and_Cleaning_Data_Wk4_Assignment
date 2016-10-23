## Check for data directory

if (!file.exists("Assignment_Data")) {
    dir.create("Assignment_Data")
}

## Download the data set 

zip_URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zip_file <- "Assignment_Data/Dataset.zip"
download.file(zip_URL, zip_file, method = "curl")

## Read the necessary data sets 

variable_names <- read.table(unz(zip_file, "UCI HAR Dataset/features.txt"))
training_subject_ids <- read.table(unz(zip_file, "UCI HAR Dataset/train/subject_train.txt"), col.names = "subject_ids", colClasses = "factor")
training_activity_labels <- read.table(unz(zip_file, "UCI HAR Dataset/train/y_train.txt"), col.names = "activity_type", colClasses = "factor")
training_dataset <- read.table(unz(zip_file, "UCI HAR Dataset/train/X_train.txt"), col.names = variable_names[,2])
test_subject_ids <- read.table(unz(zip_file, "UCI HAR Dataset/test/subject_test.txt"), col.names = "subject_ids", colClasses = "factor")
test_activity_labels <- read.table(unz(zip_file, "UCI HAR Dataset/test/y_test.txt"), col.names = "activity_type", colClasses = "factor")
test_dataset <- read.table(unz(zip_file, "UCI HAR Dataset/test/X_test.txt"), col.names = variable_names[,2])
activity_labels <- read.table(unz(zip_file, "UCI HAR Dataset/activity_labels.txt"))

## Merge the data sets

training_dataset <- cbind(training_subject_ids, training_activity_labels, training_dataset)
test_dataset <- cbind(test_subject_ids, test_activity_labels, test_dataset)
full_dataset <- rbind(training_dataset, test_dataset)

## Extract the mean and standard deviation measurements

mean_and_std_columns <- grep("mean[.]|std[.]", names(full_dataset))
mean_and_std_subset <- full_dataset[, mean_and_std_columnns]
subject_and_activities <- full_dataset[, c(1,2)]
data_subset <- cbind(subject_and_activities,mean_and_std_subset)

## Use descriptive activity names

data_subset$activity_type <- factor(data_subset$activity_type, levels=activity_labels[,1], labels=activity_labels[,2])

## Label the data set with descriptive variable names 

colnames(data_subset) <- tolower(colnames(data_subset))
colnames(data_subset) <- gsub("^t", "time_", colnames(data_subset))
colnames(data_subset) <- gsub("^f", "frequency_", colnames(data_subset))
colnames(data_subset) <- gsub(".x$", "_x_axial", colnames(data_subset))
colnames(data_subset) <- gsub(".y$", "_y_axial", colnames(data_subset))
colnames(data_subset) <- gsub(".z$", "_z_axial", colnames(data_subset))
colnames(data_subset) <- gsub(".mean..", "_mean", colnames(data_subset))
colnames(data_subset) <- gsub(".std..", "_std", colnames(data_subset))
colnames(data_subset) <- gsub("body", "body_", colnames(data_subset))
colnames(data_subset) <- gsub("gravity", "gravity_", colnames(data_subset))
colnames(data_subset) <- gsub("jerk", "_jerk", colnames(data_subset))
colnames(data_subset) <- gsub("mag", "_magnitude", colnames(data_subset))
colnames(data_subset) <- gsub("acc", "accelerometer", colnames(data_subset))
colnames(data_subset) <- gsub("gyro", "gyroscope", colnames(data_subset))

## Creating a second, independent tidy data set with the average of each variable for each activity and each subject

tidy_data_set <- aggregate(data_subset[,3:68], list(data_subset$subject_ids, data_subset$activity_type), mean)
colnames(tidy_data_set)[1:2] <- c("subject_ids", "activity_type")
tidy_data_set$subject_ids <- as.numeric(as.character(tidy_data_set$subject_ids))
tidy_data_set <- tidy_data_set[order(tidy_data_set$subject_ids),]

write.table(tidy_data_set, "tidy_data_set.txt", sep = "\t", row.names = FALSE)
()
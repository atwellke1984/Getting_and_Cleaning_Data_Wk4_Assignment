# Getting and Cleaning Data - Week 4 Course Assignment

## Background 

The purpose of this assignment was to demonstrate the ability to collect, work with, and clean a data set. 

The data set used can be found [here] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and more information about the data set can be found [here] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). 

To summarise, the data set contains the results of an experiment on human activity recognition using smartphones. Thirty volunteers aged 19-48 years old performed six activities (walking, walking upstairs, walking downstairs, sitting, standing, and laying) while wearing a Samsung Galaxy SII on their waist. The accelerometer and gyroscope embedded in the smartphone captured 3-axial linear acceleration and 3-axial angular velocity measures at a rate of 50Hz. The activities in the data set were labelled manually using video recordings. 

In addition to this README.md file, this repository contains an RScript (run_analysis.R) which retrieves the data mentioned above and works with/manipulates the data to produce a tidy data set. A Code Book is also provided which gives the details of the variables in the tidy data set.   

### run_analysis.R

According to the assignment requirements, the R Script should do the following:-

1. Merge the training and the test sets to create one data set
2. Extract only the measurements on the mean and standard deviation for each measurement
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive variable names
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject

Before step 1, the run_analysis script checks the working directory for a directory called "Assignment_Data", if the directory does not exist, it creates it. The [zip file] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) is then downloaded from the URL provided in the assignment details to this directory. 

Rather than unzipping the entire zip file, the **unz** function is used to only extract the files needed for the tidy data set. The name of these files could be found in the README.txt file and are listed below:-

* features.txt - lists all of the features (variable names)
* activity_labels.txt - links the class labels (1-6) with the activity name (walking, walking upstairs, walking downstairs, sitting, standing, laying)
* train/subject_train.txt - the subject ID for each participant in the training sample
* train/X_train.txt - the data for the participants in the training sample 
* train/y_train.txt - the class labels (activity label) associated with the data for the participants in the training sample 
* test/subject_test.txt - the subject ID for each participant in the test sample
* test/X_test.txt - the data for the participants in the test sample 
* test/y_test.txt - the class labels (activity label) associated with the data for the participants in the test sample 

While reading this data to data frames in R, I provided the column name "subject_ids" (**col.names = "subject_ids"**) for the subject ID data (train/subject_train.txt and test/subject_test.txt) and the column name "activity_type" (**col.names = "activity_type"**) for the activity labels data (train/y_train.txt and test/y_test.txt). The class for subject ID and activity label data was also specified as "factor" (**colClasses = "factor"**).  

When reading in the data for the training and test samples (train/X_train.txt and test/X_test.txt), I used the features.txt data (which had been read to a data frame named variable_names) to provide the column names (**col.names = variable_names[,2]**). 

#### Merging the training and test sets to create one data set

After examining the dimensions of the training and test sets, it became clear that the subject ID data (e.g. train/subject_train.txt), activity label data (e.g. train/y_train.txt), and variable data (e.g. train/X_train.txt) needed to be combined using the **cbind** function to provide a data frame that gave subject id, activity type and variables data for the training and test data separately (i.e. two new data frames). 

These two data frames were then combined to create one data set using the **rbind** function, so that the top of the data frame showed the subject id, activity type, and variables data for the training sample, and the bottom of the frame set showed the subject id, activity type, and variables data for the test partipants.  

#### Extracting the measurements on the mean and standard deviation for each measurement

Using the **grep** function, the columns from the merged data set discussed above that contained "mean." or "std." (**"mean[.]|std[.]"**) were subsetted. Only the measurements that contained mean() or std() were extracted. The meanFreq() variable was not also extracted as this measurement was not associated with an accompanying standard deviation. 

#### Using descriptive activity names to name the activities in the data set

The **factor** function was used to re-label the activity labels in the data set from a value of 1 to 6 (**levels=activity_labels[,1]**) to the descriptive label (**labels=activity_labels[,2]**) provided in the activity_labels.txt data. 

#### Labelling the data set with descriptive variable names

Before re-labelling the variables in the data set, the **tolower** function was used to change all variable names to be consistently in a lower case. The **gsub** function was then used to make several changes to the variable names and provide longer, more descriptive labels. For example, after using the **gsub** function, the variable "tBodyAcc.mean...X" was re-labelled as "time_body_accelerometer_mean_x_axial". More details of the variables names and what they mean can be found in the Code Book in this repository. 

#### Creating a second, independent tidy data set with the average of each variable for each activity and each subject

The **aggregate** function is used to collapse the data by subject id and activity type using a mean function. The subsequent data set is re-ordered to provide the data in ascending order by subject id and then the data is written to a text file (tidy_data_set.txt).  

### CodeBook.md

Please see the Code Book for details of the measurements in the tidy data set (tidy_data_set.txt).

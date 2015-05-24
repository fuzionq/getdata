# CodeBook

Data were read in, giving a 561-feature vector with time and frequency domain variables.
These are from measurements of the accelerometer and gyroscope in a mobile phone, carried around by multiple subjects.

The test and training datasets were combined, and descriptive activity names were attached to the data set.

For the dat dataframe:

* Columns 1:79 show only the mean and standard deviation for each measurement, as determined by using grep for "mean|std".
* subjectID: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
* Activity: Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.
Each row shows which activity the subject was doing.

A second dataframe, tidy_dat, is created with the average of each variable for each activity and each subject.

Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

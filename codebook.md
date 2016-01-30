##Data Description:
This processed and tidy dataset is derived from "Human Activity Recognition Using Smartphones Data Set (version1.0)" which can be originally obtained here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 
Refer to Readme.txt file for further details.

The set of variables that were estimated from these signals are:
mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values.
iqr(): Interquartile range
entropy(): Signal entropy
arCoeff(): Autoregression coefficients with Burg order equal to 4
correlation(): Correlation coefficient between two signals
maxInds(): Index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): Skewness of the frequency domain signal
kurtosis(): Kurtosis of the frequency domain signal
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between some vectors.



 Mean and standard deviation were estimated for this assignment purpose in  the following observed signals 
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions. 

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


## Data Transformation
The raw data set is processed by using run_analysis.R script. tp create tidy data set.

##Creating the tidy datafile
###For  this project,  the files that will be used to load data are listed as follows:

test/subject_test.txt
test/X_test.txt
test/y_test.txt
train/subject_train.txt
train/X_train.txt
train/y_train.txt

From the source, Reference link: https://class.coursera.org/getdata-008/forum/thread?thread_id=24 , we deduced that:

 *data in “Y_train.txt” and “Y_test.txt” provides value for 'activity' variable
 *data in “subject_train.txt” and subject_test.txt" provides value for 'subject' variable
 *data in “X_train.txt” and “X_test.txt” provides values for 'feature' variable
 *features.txt” provides name for various features 
 *activity_labels.txt” gives details for level of activity types

**So we will use Activity, Subject and Features as part of descriptive variable names for data in data frame.

###Merge training and test data sets

*Test and training data (X_train.txt, X_test.txt), subject ids (subject_train.txt, subject_test.txt) and activity ids (y_train.txt, y_test.txt) are merged to obtain a single data set. Variables are labelled with the names assigned by original collectors ( Subject, activity,features.txt) ***(as mentioned above).
*Column indices with  mean and std were extracted by running a grep from merged dataframe. Descriptive activity names from activity_labels file  are used to label the activity type in merged data. 
.*Replaced the following acronyms :

Acc is replaced with Accelerometer

Gyro is replaced with Gyroscope

BodyBody is replaced with Body

Mag is replaced with Magnitude

Character f is replaced with Frequency

Character t is replaced with Time
 
*created second tidy data set by grouping dat acoording to subject and activity and calculated the mean for each variable and write it into data table.



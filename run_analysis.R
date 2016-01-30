##load required packages
library(dplyr)
library(tidyr)
library(data.table)
#download file and stored in coursera directory
#setwd("C:/Users/nitin/Desktop/coursera/UCI HAR Dataset")
filelist<- list.files("UCI HAR Dataset", recursive = TRUE)
##read activity_label,features and all test & training files
activitylabel<- read.table("activity_labels.txt", quote="\"")
features <- read.table("features.txt", quote="\"")
X_train <- read.table("train/X_train.txt", quote="\"")
X_test <- read.table("test/X_test.txt", quote="\"")
y_train <- read.table("train/y_train.txt", quote="\"")
y_test <- read.table("test/y_test.txt", quote="\"")
subject_train <- read.table("train/subject_train.txt", quote="\"")
subject_test <- read.table("test/subject_test.txt", quote="\"")
##concatenate train and test data frames
subject<- rbind(subject_train, subject_test)
x_data<- rbind( X_train, X_test)
y_data<- rbind(y_train, y_test)
##name the columns of concatenated data frames
names(subject)<- "subject"
names(y_data)<- "activity"
names(features)<- c("number","name")
names(x_data)<- features$name
names(activitylabel)<- c("number", "activitytype")
##merge columns of subject, x and y data
subactivity<- cbind(subject,y_data)
mergedata<- cbind(subactivity, x_data)
##extract columns with mean and std from merged data
colMeanSTD <- grep(".*Mean.*|.*Std.*", names(mergedata), ignore.case=TRUE)
finalmstd<- mergedata[,c(1,2,colMeanSTD)]
##merge activity_label data to reaplce the number with activitytype in finalmstd
prodata <- merge(activitylabel, finalmstd , by.x = "number", by.y = "activity")
#remove column with number
prodata1<- prodata[,-1]
## tidy-fy the column list 
names(prodata1)<-gsub("std()", "SD", names(prodata1))
names(prodata1)<-gsub("^t", "time", names(prodata1))
names(prodata1)<-gsub("^f", "frequency", names(prodata1))
names(prodata1)<-gsub("Acc", "Accelerometer", names(prodata1))
names(prodata1)<-gsub("Gyro", "Gyroscope", names(prodata1))
names(prodata1)<-gsub("Mag", "Magnitude", names(prodata1))
names(prodata1)<-gsub("BodyBody", "Body", names(prodata1))
## find the mean for each combination of subject and activity type
aggdata<-aggregate(. ~subject + activitytype, prodata1, mean)
orderdata<- aggdata[order(aggdata$subject,aggdata$activitytype),]
##write new tidydata set into text file "final.txt)
run<- write.table(orderdata,"./tidydata.txt", row.names = FALSE)
tidydata<- read.table("tidydata.txt")





==================================================================
Getting and Cleaning Data
Course Project
==================================================================

##This R script creates a tidy data set out of the UCI HAR Dataset which can be accessed here: "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones".

##The finished tidy data set has 180 rows each containing a unique combination of activity and subject. The measurement variables are averages of the mean and standard deviation variables from the signals in the UCI HAR Dataset. 

##The script first uses the following code to read all the relevant files and store them in data frames:
        
testset<-read.table("./UCI HAR Dataset/test/X_test.txt")
trainset<-read.table("./UCI HAR Dataset/train/X_train.txt")
test_labels<-read.table("./UCI HAR Dataset/test/y_test.txt")
train_labels<-read.table("./UCI HAR Dataset/train/y_train.txt")
test_subjects<-read.table("./UCI HAR Dataset/test/subject_test.txt")
train_subjects<-read.table("./UCI HAR Dataset/train/subject_train.txt")
features<-read.table("./UCI HAR Dataset/features.txt")

##Next, the script uses the train_labels and test_labels data to append a new "activity" variable to the trainset and testset, respectively. The train_subjects and test_subjects data are used to append a new "subject" variable to the trainset and testset:

testset[,"activity"]<-factor(test_labels$V1)
trainset[,"activity"]<-factor(train_labels$V1)
testset[,"subject"]<-factor(test_subjects$V1)
trainset[,"subject"]<-factor(train_subjects$V1)

##The trainset and testset now each contain 563 variables.

##Next, the trainset and testset are combined into a single dataframe:

data<-rbind(testset,trainset)

##The activity_labels.txt file is then read into R and stored as an object. A for loop replaces the values in the activity variable of data with the following descriptive names:
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

activities<-read.table("./UCI HAR Dataset/activity_labels.txt")

for (i in 1:nrow(activities)) {
        data$activity<-gsub(i,activities$V2[i],data$activity)
}

##The first 561 variable names - everything except the "activity" and "subject" variable - are then replaced with better descriptors. I chose to use the full variable name (ie. "tBodyAcc-mean()-X") because I didn't think the names could be shortened without losing information. 
        
variables<-as.character(features$V2)
colnames(data)[1:length(variables)]<-variables

##Next, the script extracts only the mean and standard deviation for each measurement. I included the mean and standard deviation for the variables below ('-XYZ' is used to denote 3-axial signals in the X, Y and Z directions). I did not include any of the "meanFreq" variables because those represent a different measurement than simply the mean of the variable. The simple mean was included, but the meanFreq was not.   
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

meanstd<-c("mean()","std()")
meanFreq<-grepl("meanFreq()",features$V2)
variables<-grepl(paste(meanstd,collapse="|"),features$V2)
variables[meanFreq]<-FALSE
data<-data[,variables==1]

##Finally, I melted the data using the reshape2 package, designating the "activity" and "subject" variables as ID variables, and all the other variables as measurement variables. I then re-cast the melted data frame so that for every unique combination of activity and subject there would be a mean value for every other variables. 
        
install.packages("reshape2")
library(reshape2)
melt<-melt(data,id=c("activity","subject"),measure.vars=(colnames(data)[1:66]))
means<-dcast(melt,activity+subject~variable,mean)

write.table(means,file="./tidydata.txt")
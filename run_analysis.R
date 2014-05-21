##You should create one R script called run_analysis.R that does the following:
        
##Merge the training and the test sets to create one data set.

testset<-read.table("./UCI HAR Dataset/test/X_test.txt")
trainset<-read.table("./UCI HAR Dataset/train/X_train.txt")
test_labels<-read.table("./UCI HAR Dataset/test/y_test.txt")
train_labels<-read.table("./UCI HAR Dataset/train/y_train.txt")
test_subjects<-read.table("./UCI HAR Dataset/test/subject_test.txt")
train_subjects<-read.table("./UCI HAR Dataset/train/subject_train.txt")
features<-read.table("./UCI HAR Dataset/features.txt")

testset[,"activity"]<-factor(test_labels$V1)
trainset[,"activity"]<-factor(train_labels$V1)
testset[,"subject"]<-factor(test_subjects$V1)
trainset[,"subject"]<-factor(train_subjects$V1)

data<-rbind(testset,trainset)

##Use descriptive activity names to name the activities in the data set:

activities<-read.table("./UCI HAR Dataset/activity_labels.txt")

for (i in 1:nrow(activities)) {
        data$activity<-gsub(i,activities$V2[i],data$activity)
}

##Appropriately labels the data set with descriptive variable names.
        
variables<-as.character(features$V2)
colnames(data)[1:length(variables)]<-variables

##Extracts only the measurements on the mean and standard deviation for each measurement.

meanstd<-c("mean()","std()")
meanFreq<-grepl("meanFreq()",features$V2)
variables<-grepl(paste(meanstd,collapse="|"),features$V2)
variables[meanFreq]<-FALSE
data<-data[,variables==1]

##Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
        
install.packages("reshape2")
library(reshape2)
melt<-melt(data,id=c("activity","subject"),measure.vars=(colnames(data)[1:66]))
means<-dcast(melt,activity+subject~variable,mean)

##writes new tidy data set to a file called tinydata.txt:

write.table(means,file="./tidydata.txt")
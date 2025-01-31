Course Project
Getting and Cleaning Data
==========================

Codebook

1. activity

6 levels: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, 
LAYING. From the original UCI HAR dataset. 

2. subject

One of 30 subjects involved in the study. From the original UCI HAR dataset. 

3. 66 measurement variables

These variables come from the features.txt file in the UCI HAR dataset. Mean 
and Standard Deviation variables were taken for the 33 measurements listed below
('-XYZ' is used to denote 3-axial signals in the X, Y and Z directions). I did 
not include any of the "meanFreq" variables because those represent a different 
measurement than simply the mean of the variable. The simple mean was included, 
but the meanFreq was not.   

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

More about the experiments that product the raw data (see README file in UCI HAR
dataset):
        
The experiments have been carried out with a group of 30 volunteers within an 
age bracket of 19-48 years. Each person performed six activities (WALKING, 
WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a 
smartphone (Samsung Galaxy S II) on the waist. The embedded accelerometer and 
gyroscope captured 3-axial linear acceleration and 3-axial angular velocity at 
a constant rate of 50Hz. The experiments were video-recorded to label the data 
manually. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying 
noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 
50% overlap (128 readings/window). The sensor acceleration signal, which has 
gravitational and body motion components, was separated using a Butterworth 
low-pass filter into body acceleration and gravity. The gravitational force is 
assumed to have only low frequency components, therefore a filter with 0.3 Hz 
cutoff frequency was used. From each window, a vector of features was obtained 
by calculating variables from the time and frequency domain. See 
'features_info.txt' for more details. 

The accelerometer and gyroscope produced 3-axial raw signals tAcc-XYZ and 
tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured 
at a constant rate of 50 Hz. Then they were filtered using a median filter and a
3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove 
noise. Similarly, the acceleration signal was then separated into body and 
gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another 
low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in 
time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the 
magnitude of these three-dimensional signals were calculated using the Euclidean 
norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, 
tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals 
producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, 
fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain 
signals). 
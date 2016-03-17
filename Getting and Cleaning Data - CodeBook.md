---
title: "CodeBook for TidyData - Getting and Cleaning Data Course Project"
author: "Bill Roka"
date: "March 16, 2016"
output: word_document
---

## TidyData Dataset Statistics (via glimpse(TidyData))

Observations: 180  
Variables: 68  

Variables defined below:

## Definitions for TidyData Subject and Activity Variables

* __subject__  -- Identifying Numbers 1 to 30, based upon the 30 subjects of the original experiment **(unit type integers)**.  

* __activity__ -- The 6 Activities from the original experiment **(unit type factors)**: 
    + WALKING 
    + WALKING_UPSTAIRS 
    + WALKING_DOWNSTAIRS 
    + SITTING 
    + STANDING
    + LAYING

## Averages of Experimental Observations Variables (or "Features"), grouped by Subject and Activity  (unit type numeric (dbl))

Note: Abbreviations in the original fields (contained in the "features.txt" file downloaded from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>) have been modified to 
create the new, more descriptive column headers found in the final "TidyData.txt" file.

The following description substitutions were employed:  

* "mean" replaced by **"Mean"**
* "std" replaced by **"Standard_Deviation"**
* "Acc" replaced by  **"Accelerometer"**
* "Gyro" replaced by  **"Gyroscope"**
* "Mag" replaced by **"Magnitude"**
* "BodyBody" replaced by **"Body"**
* "^t" replaced by  **"Time"**
* "^f" replaced by **"Frequency"**

**Unit type for all subsequent variables are numeric (dbl).**

### Body Signal Based Observations:

#### Frequency-Domain Based Observations:

#### Accelerometer Readings by Mean
* FrequencyBodyAccelerometer.Mean()-X
* FrequencyBodyAccelerometer.Mean()-Y
* FrequencyBodyAccelerometer.Mean()-Z

#### Accelerometer Readings by Standard Deviation
* FrequencyBodyAccelerometer.Standard_Deviation()-X
* FrequencyBodyAccelerometer.Standard_Deviation()-Y
* FrequencyBodyAccelerometer.Standard_Deviation()-Z

#### Accelerometer Jerk (acceleration and angular velocity) Readings by Mean
* FrequencyBodyAccelerometerJerk.Mean()-X
* FrequencyBodyAccelerometerJerk.Mean()-Y
* FrequencyBodyAccelerometerJerk.Mean()-Z

#### Accelerometer Jerk (acceleration and angular velocity) Readings by Standard Deviation
* FrequencyBodyAccelerometerJerk.Standard_Deviation()-X
* FrequencyBodyAccelerometerJerk.Standard_Deviation()-Y
* FrequencyBodyAccelerometerJerk.Standard_Deviation()-Z

#### Accelerometer Magnitude Readings by Mean
* FrequencyBodyAccelerometerMagnitude.Mean()

#### Accelerometer Magnitude Readings by Standard Deviation
* FrequencyBodyAccelerometerMagnitude.Standard_Deviation()

#### Accelerometer Jerk (acceleration and angular velocity) Magnitude Readings by Mean
* FrequencyBodyAccelerometerJerkMagnitude.Mean()

#### Accelerometer Jerk (acceleration and angular velocity) Magnitude Readings by Standard Deviation
* FrequencyBodyAccelerometerJerkMagnitude.Standard_Deviation()

#### Gyroscope Readings by Mean
* FrequencyBodyGyroscope.Mean()-X
* FrequencyBodyGyroscope.Mean()-Y
* FrequencyBodyGyroscope.Mean()-Z

#### Gyroscope Readings by Standard Deviation
* FrequencyBodyGyroscope.Standard_Deviation()-X
* FrequencyBodyGyroscope.Standard_Deviation()-Y
* FrequencyBodyGyroscope.Standard_Deviation()-Z

#### Gyroscope Magnitude Readings by Mean
* FrequencyBodyGyroscopeMagnitude.Mean()

#### Gyroscope Magnitude Readings by Standard Deviation
* FrequencyBodyGyroscopeMagnitude.Standard_Deviation()

#### Gyroscope Jerk (acceleration and angular velocity) Magnitude Readings by Mean
* FrequencyBodyGyroscopeJerkMagnitude.Mean()

#### Gyroscope Jerk (acceleration and angular velocity) Magnitude Readings by Standard Deviation
* FrequencyBodyGyroscopeJerkMagnitude.Standard_Deviation()  


### Time-Domain Based Observations:  


#### Accelerometer Readings by Mean
* TimeBodyAccelerometer.Mean()-X
* TimeBodyAccelerometer.Mean()-Y
* TimeBodyAccelerometer.Mean()-Z

#### Accelerometer Readings by Standard Deviation
* TimeBodyAccelerometer.Standard_Deviation()-X
* TimeBodyAccelerometer.Standard_Deviation()-Y
* TimeBodyAccelerometer.Standard_Deviation()-Z

#### Accelerometer Jerk (acceleration and angular velocity) Readings by Mean
* TimeBodyAccelerometerJerk.Mean()-X
* TimeBodyAccelerometerJerk.Mean()-Y
* TimeBodyAccelerometerJerk.Mean()-Z

#### Accelerometer Jerk (acceleration and angular velocity) Readings by Standard Deviation
* TimeBodyAccelerometerJerk.Standard_Deviation()-X
* TimeBodyAccelerometerJerk.Standard_Deviation()-Y
* TimeBodyAccelerometerJerk.Standard_Deviation()-Z

#### Accelerometer Magnitude Readings by Mean
* TimeBodyAccelerometerMagnitude.Mean()

#### Accelerometer Magnitude Readings by Standard Deviation
* TimeBodyAccelerometerMagnitude.Standard_Deviation()

#### Accelerometer Jerk (acceleration and angular velocity) Magnitude Readings by Mean
* TimeBodyAccelerometerJerkMagnitude.Mean()

#### Accelerometer Jerk (acceleration and angular velocity) Magnitude Readings by Standard Deviation
* TimeBodyAccelerometerJerkMagnitude.Standard_Deviation()

#### Gyroscope Readings by Mean
* TimeBodyGyroscope.Mean()-X
* TimeBodyGyroscope.Mean()-Y
* TimeBodyGyroscope.Mean()-Z

#### Gyroscope Readings by Standard Deviation
* TimeBodyGyroscope.Standard_Deviation()-X
* TimeBodyGyroscope.Standard_Deviation()-Y
* TimeBodyGyroscope.Standard_Deviation()-Z

#### Gyroscope Jerk (acceleration and angular velocity) Magnitude Readings by Mean
* TimeBodyGyroscopeJerk.Mean()-X
* TimeBodyGyroscopeJerk.Mean()-Y
* TimeBodyGyroscopeJerk.Mean()-Z

#### Gyroscope Jerk (acceleration and angular velocity) Magnitude Readings by Standard Deviation
* TimeBodyGyroscopeJerk.Standard_Deviation()-X
* TimeBodyGyroscopeJerk.Standard_Deviation()-Y
* TimeBodyGyroscopeJerk.Standard_Deviation()-Z

#### Gyroscope Magnitude Readings by Mean
* TimeBodyGyroscopeMagnitude.Mean()

#### Gyroscope Magnitude Readings by Standard Deviation
* TimeBodyGyroscopeMagnitude.Standard_Deviation()

#### Gyroscope Jerk (acceleration and angular velocity) Magnitude Readings by Mean
* TimeBodyGyroscopeJerkMagnitude.Mean()

#### Gyroscope Jerk (acceleration and angular velocity) Magnitude Readings by Standard Deviation
* TimeBodyGyroscopeJerkMagnitude.Standard_Deviation()  


### Gravity Signal Based Observations:  


#### Accelerometer Readings by Mean
* TimeGravityAccelerometer.Mean()-X
* TimeGravityAccelerometer.Mean()-Y
* TimeGravityAccelerometer.Mean()-Z

#### Accelerometer Readings by Standard Deviation
* TimeGravityAccelerometer.Standard_Deviation()-X
* TimeGravityAccelerometer.Standard_Deviation()-Y
* TimeGravityAccelerometer.Standard_Deviation()-Z

#### Accelerometer Magnitude Readings by Mean
* TimeGravityAccelerometerMagnitude.Mean()

#### Accelerometer Magnitude Readings by Standard Deviation
* TimeGravityAccelerometerMagnitude.Standard_Deviation()




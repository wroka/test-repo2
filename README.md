---
title: "Getting and Cleaning Data - ReadMe for Course Assignment"
author: "Bill Roka"
date: "March 16, 2016"
output: word_document
---

# Tidy Dataset ("tidydata.txt") from Human Activity Recognition Using Smartphones Dataset

The authors of the original HAR dataset provide the following description in their "readme.txt" file:

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

This original dataset contained the files **"activity_labels.txt"**, which described the 6 activities performed by the 30 volunteers; **"features.txt"**, which listed the column headers of the experiments performed, and **"features_info.txt"**, which elaborated on the definitions of the experiments listed in **"features.txt"**.  

In addition, the dataset housed two subdirectories ("test" and "train"), which contained the lists of **subjects** (aka. volunteers), **experiments** (aka "X_" files), and **activities** (aka "Y_" files), for the test group (30% of participants) and the training group (70% of participants), respectively.

**To create a tidy dataset from the original files**, I arranged the files into a final table that displays the average of each experiment (or "**feature**"), grouped by the 30 **subjects** (volunteers) and the 6 **activities** they performed. This structure complies with the "tidy data" convention of data containing a single row per subject / activity, and a single column for each measurement. There are 180 total rows in the final set: each subject (30) perfomed each "feature" (6).



To accomplish this, I took the following steps:

1. Downloaded and installed files from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>.
    + Installed the R package "dplyr", which was used in analysis.
    + Downloaded all necessary files and unzipped them into a "data" subdirectory of my main working directory.

2. Brought in the files in three sections: Features, Subject and Activity, subsetting each section by "test" and "train".

3. Merged the Training and Test sets into a single dataset.

4. Created more "readable" column names for the Features, Subjects and Activities.
    + The subject data was simply labeled "subject" (there are no lookup values for actual participant names).
    + Activities were read in from the "activity_labels.txt" file.
    + Features were read in from the "features.txt" file.  
   
5. Restricted the file to Mean and Standard Deviation measurements only.
    + This was performed by selecting the features columns with "std()" and "mean()" in the name, then subsetting the data by these features.

6. Continued renaming process by renaming features of columns with descriptive names.
    + Abbreviations in "features" names were substituted with more readible expressions ("Gyroscope" for "Gyro", for example).
   
7. Finally, the tidy dataset is created by grouping the file by subject and activity, summarizing by taking the mean of each subject/activity pair, 
    and ordering the file by subject and activity in ascending order.
   
The **run_analysis.R** script performs all of these functions and writes the file **"tidydata.txt"** when complete.

If you'd like to review the file in R (or RStudio), uncomment the final two lines of script at the bottom of run_analysis.R

```{r, eval=FALSE}
read_tidy <- read.table("tidydata.txt",header = TRUE)
View(read_tidy)
```






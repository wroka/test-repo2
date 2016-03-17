# Getting and Cleaning Data - Course Project - Tidy Data.

# Install necessary libraries
library(dplyr)

# Download files - create data folder to house files, if it doesn't exist.
if(!file.exists("./data"))
{dir.create("./data")}
URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(URL, destfile="./data/Dataset.zip")

# Unzip files to data folder
unzip(zipfile="./data/Dataset.zip", exdir="./data")

# Retrieve list of files from UCI HAR DATASET folder (within /data folder structure)
path_ref <- file.path("./data" , "UCI HAR Dataset") # use file.path to construct file path - easier than paste
files <-list.files(path_ref, recursive=FALSE) # TRUE if you want to search subdirectories. I'm ignoring the "Inertial Signals" subdirectories.

# Bring in relevant data, based upon groups in dataset: Features / Subject / Activities.
### "Features" is comprised of the experiment observances; 
### "Subject" records the 30 volunteers (per activity) 1-30; 
### "Activity" represents six possible actions (found in activity_labels.txt): WALKING,WALKING_UPSTAIRS,WALKING_DOWNSTAIRS,SITTING,STANDING,LAYING.
### The experiment was divided into 70% training and 30% test sets for analysis. Test and Train sets are divided below.

FeaturesTestSet  <- read.table(file.path(path_ref, "test" , "X_test.txt" ),header = FALSE)
FeaturesTrainSet <- read.table(file.path(path_ref, "train", "X_train.txt"),header = FALSE)
SubjectTestSet  <-  read.table(file.path(path_ref, "test" , "subject_test.txt"),header = FALSE)
SubjectTrainSet <-  read.table(file.path(path_ref, "train", "subject_train.txt"),header = FALSE)
ActivityTestSet  <- read.table(file.path(path_ref, "test" , "Y_test.txt" ),header = FALSE)
ActivityTrainSet <- read.table(file.path(path_ref, "train", "Y_train.txt"),header = FALSE)

# Now, merge the training and the test sets to create one data set.

## 1) Bring in all rows by type (Features, Subject and Activity)
Features_data <- rbind(FeaturesTrainSet, FeaturesTestSet)
Subject_data  <- rbind(SubjectTrainSet, SubjectTestSet)
Activity_data <- rbind(ActivityTrainSet, ActivityTestSet)
## 2) Bind all sets together (using column-binding) into "Temp_Data".
Temp_Data <- cbind(Subject_data, Activity_data, Features_data)

# Uses descriptive activity names to name the activities in the data set.

## 1) Use the features.txt file to name features (instead of V1,V2, etc.). These values will be rendered more readible later in this script.
##    Use "subject" and "activity" to name variable headers.
Featurenames_temp <- read.table(file.path(path_ref, "features.txt"),head=FALSE)
FeatureNames <- as.character(Featurenames_temp[,2])
Headers <- c("subject", "activity", FeatureNames)
## 2) colnames function renames Temp_Data headers using our newly created "Headers" object.
colnames(Temp_Data) <- Headers

# Extract Mean / Standard Deviation measurements only.

## 1) Find subset of Features with std or mean in the name. 
### Note: I only selected columns with "std()" or "mean()", not "meanFreq", which is defined as the "weighted average of the frequency components..."
### in the 'features_info.txt' file from UCI HAR DATASET.
std_mean_names <- Featurenames_temp$V2[c(1:6,41:46,81:86,121:126,161:166,201:202,214:215,227:228,240:241,253:254,266:271,345:350,424:429,503:504,516:517,529:530,542:543)]
## 2) Create character list of all column names in Data, including subject and activity. Will use to subset data.
Select_Names <- c(as.character(std_mean_names), "subject", "activity" ) 
## 3) Create "Data" table of all ungrouped rows, subset by "Select_Names" variable (std and mean columns,subject,activity)
Data <- subset(Temp_Data, select = Select_Names)

# Appropriately labels the data set with descriptive variable names.

## 1) Read names of descriptive labels of activity.
Activity_Labels <- read.table(file.path(path_ref, "activity_labels.txt"),header = FALSE)
## 2) Use "Activity_Labels" to create "activity_name" column with descriptive name and add to Data.
names(Activity_Labels) <- c("activity","activity_name")
## 3) Append labels to "Data" using join.
Data <- left_join(Data, Activity_Labels, by="activity")
## 4) Remove original activity-numeric column from Data and rename "activity name" as "activity".
Data$activity <- NULL
names(Data) <- sub("^activity_name$", "activity", names(Data))

## 5) Continue renaming process by renaming features of columns with descriptive names.
names(Data) <- gsub('-mean',".Mean",names(Data))
names(Data) <- gsub('-std',".Standard_Deviation",names(Data))
names(Data) <- gsub("Acc", "Accelerometer", names(Data))
names(Data) <- gsub("Gyro", "Gyroscope", names(Data))
names(Data) <- gsub("Mag", "Magnitude", names(Data))
names(Data) <- gsub("BodyBody", "Body", names(Data))
names(Data) <- gsub("^t", "Time", names(Data))
names(Data) <- gsub("^f", "Frequency", names(Data))

# Finally, create tidy data!

## Take the mean of all columns in Data, excluding subject and activity. Sort by subject asc, activity asc.
TidyData <- Data %>%
  group_by(subject, activity) %>%
    summarise_each(funs(mean)) %>%
      arrange(subject,activity)
# Write file to "tidydata.txt"
write.table(TidyData, file = "tidydata.txt", row.name=FALSE)
################### write.xlsx2(TidyData, file = "tidydata.xlsx")

## If you'd like to read tidydata.txt in R, uncomment the following lines
## read_tidy <- read.table("tidydata.txt",header = TRUE)
## View(read_tidy)



library(tidyr)
library(dplyr)
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "./galaxy.zip")
date_dl <- date()
unzip("galaxy.zip")
        x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
        x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
        y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
        y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
        subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
        subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
        features <- read.table("./UCI HAR Dataset/features.txt")
merged_all <- rbind(x_test, x_train)
indices <- c(grep("mean()|std()", features$V2))
msmts <- merged_all[indices]
subjects_all <- rbind(subject_test, subject_train)
activities_all <- rbind(y_test, y_train)
msmts_df <- cbind(subjects_all, activities_all, msmts)
        msmts_df[msmts_df[,2]==1,2] <- "Walking"
        msmts_df[msmts_df[,2]==2,2] <- "Walking Upstairs"
        msmts_df[msmts_df[,2]==3,2] <- "Walking Downstairs"
        msmts_df[msmts_df[,2]==4,2] <- "Sitting"
        msmts_df[msmts_df[,2]==5,2] <- "Standing"
        msmts_df[msmts_df[,2]==6,2] <- "Laying"
var_names <- features[indices, 2]
var_names <- as.character(var_names)
names(msmts_df)[3:81] <- var_names
names(msmts_df)[1:2] <- c("Subject", "Activity")
tbl_df(msmts_df)
averages <- msmts_df %>% group_by(Subject, Activity) %>% summarize_each(funs(mean))
print(averages)
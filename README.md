# Tidy-Data-Assignment
Creating a tidy data set from Samsung Galaxy data

This code begins by downloading, unzipping, and reading in the Samsung Galaxy data from the internet. The measurements from the "test" and "train" subjects are combined to create one cohesive data set. Next, only the measurements involving a mean or a standard deviation are pulled from the data set. The "activity" and "variable" labels are replaced with more descriptive labels as provided in the Samsung data. Finally, the average of each of these pulled measurements is computed for each subject (30 total) and each activity (6 total), leaving us with 130 observations. The dataframe consisting of these averages is printed to the screen. 

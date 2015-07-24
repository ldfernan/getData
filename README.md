---
title: "Tidy Data: Human Activity Recognition Using Smartphones Data Set"
author: "ldfernan"
date: "July, 23, 2015"
---

### Project Description
This script reads, cleans and consolidates human motion data (training and test) collected by 30 subjects for a variety of activities using a samsung phones hardware.

##### Notes on the original (raw) data 
The data should be downloaded from [UCI Machine Learning Data Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The data folder contains two folders called "test" and "train".

##### Data Components
Refer readme.txt file in the data folder for specific file names and raw data structure.
- Activity - Walking, Sitting, etc. Data in long form (one long column)
- Subject - The number indicating the participants/subjects. Data is in long form.
- Features - Several measurements are captured using the phone hardware. Some preliminary cleanup is performed on the data. The measurements are also standardized to make it fall in the range -1 to +1 (without losing actual information). Features data is in wide form (one long row)

#### Creating the tidy datafile

##### Getting raw data and setting up R

+ Download the data from [UCI Machine Learning Data Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
+ Create a folder in your computer called "project". Unzip the contents of the zip file into "project" folder.
+ Set "project" folder as your R working directory.
+ Install libraries (dplyr and reshape2) 

##### Structure of run_analysis.R script

The R script should be places in the R working directory ("project"). Use either R prompt or RStudio to run the script. 
 - Import necessary libraries (dplyr and reshape2)
 - Reads data from traning and test folders of the motion data
 - Consolidates data files within training and test data folders (to merge activity, subject and features data using cbind)
 - Combine training and test data (rbind)
 - Select only necessary columns (mean and standard deviations using filters on column names that contain mean() and std())
 - Rename the feature names to give them meaningful names
 - Convert to a long form data
 - Summarize (take means) of the data values for each subject-activity-measure

#####Code Book

######Description of the variables in the project_submit.txt file

The project_submit.txt file contains four columns

+ activityName: 
Possible vaues include
    + WALKING
    + WALKING_UPSTAIRS  
    + WALKING_DOWNSTAIRS
    + SITTING
    + STANDING
    + LAYING

+ subjectName
    + This row contains the subject numbers for each of the 30 participants. The range of data is 1-30
    + This is a numeric column

+ featureName
    + This column contains the feature names.
    + Values either start with 'time' or 'freq'
    + MeanX and StdDevX are means and standard deviations of the respective measurements for X. The data includes data for Y and Z as well.

+ featureMean
    + This column contains the mean of the standardized values of feature measurements.
    + The data is in range -1 to 1
    + This data is unit-less due to standardization.

##### Bibliography
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012


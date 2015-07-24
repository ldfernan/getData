---
title: "Tidy Data: Human Activity Recognition Using Smartphones Data Set"
author: "ldfernan"
date: "July, 23, 2015"
---

### Project Description
This script reads, cleans and consolidates human motion data (training and test) collected by 30 subjects for a variety of activities using a samsung phones hardware.

##### Notes on the original (raw) data 
The data should be downloaded from [UCI Machine Learning Data Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The data folder contains two folders called "test" and "train".

###### Data Components
Refer readme file in the data folder for specific file names.
- Activity - Walking, Sitting, etc. Data in long form (one long column)
- Subject - The number indicating the participants/subjects. Data is in long form.
- Features - Several measurements are captured using the phone hardware. Some preliminary cleanup is performed on the data. The measurements are also standardized to make it fall in the range -1 to +1 (without losing actual information). Features data is in wide form (one long row)

#### Creating the tidy datafile

##### Getting raw data and setting up R

1. Download the data from [UCI Machine Learning Data Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
2. Create a folder in your computer called "project". Unzip the contents of the zip file into "project" folder.
3. Set "project" folder as your R working directory.
4. Install libraries (dplyr and reshape2) 

##### run_analysis.R script

The R script should be places in the R working directory ("project"). Use either R prompt or RStudio to run the script. 
 - Import necessary libraries (dplyr and reshape2)
 - Reads data from traning and test folders of the motion data
 - Consolidates data files within training and test data folders (to merge activity, subject and features data using cbind)
 - Combine training and test data (rbind)
 - Select only necessary columns (mean and standard deviations using filters on column names that contain mean() and std())
 - Rename the columns to give them meaningful names
 - Convert to a long form data
 - Summarize (take means) of the data values for each subject-activity-measure

##Description of the variables in the project_submit.txt file
General description of the file including:
 - Dimensions of the dataset
 - Summary of the data
 - Variables present in the dataset

(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)

###Variable 1 (repeat this section for all variables in the dataset)
Short description of what the variable describes.

Some information on the variable including:
 - Class of the variable
 - Unique values/levels of the variable
 - Unit of measurement (if no unit of measurement list this as well)
 - In case names follow some schema, describe how entries were constructed (for example time-body-gyroscope-z has 4 levels of descriptors. Describe these 4 levels). 

(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)

####Notes on variable 1:
If available, some additional notes on the variable not covered elsewehere. If no notes are present leave this section out.

##### Bibliography
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012


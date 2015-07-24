---
title: "Codebook template"
author: "LDFERNAN"
date: "July, 23, 2015"
---

## Project Description
This script reads, cleans and consolidates motion data(training and test) collected using a samsung phone for 30 subjects for a variety of activities.

##Script Structure
 - Reads data from traning and test folders of the motion data
 - Consolidates data files within traning and test data folders (to merge activity, subject and feature data)
 - Combines training and test data
 - Select only necessary columns (mean and standard deviations)
 - Rename the columns to give them meaningful names
 - Convert to a long form data
 - Summarize (take mean) of the data values for each subject-activity-measure

###Collection of the raw data
Description of how the data was collected.

###Notes on the original (raw) data 
Some additional notes (if avaialble, otherwise you can leave this section out).

##Creating the tidy datafile

###Guide to create the tidy data file
Description on how to create the tidy data file (1. download the data, ...)/

###Cleaning of the data
Short, high-level description of what the cleaning script does. [link to the readme document that describes the code in greater detail]()

##Description of the variables in the tiny_data.txt file
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


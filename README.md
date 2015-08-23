# GettingAndCleaningDataProject
files for project 1 of Getting and Cleaning Data

## Description of Files
1. run_analysis.R - Preforms the analysis of taking the data set from how it is currently presented to the generation of a table with the average of each variable for each activity and each subject.
  + To call this script, you must pass the following file.path parameters to the run_analysis function in this order: trainingFile,testingFile,featureNames, trainY, testY, subjectTrain, subjectTest
  + The run_analysis.R function preforms the following actions once called:    
    -Read in training data set and testing data sets into two data tables.    
    -Merge these two tables.     
    -Read in training Y(Activity) and testing Y (Activity) values into two data tables.   
    -Merge these two tables.    
    -Read in subject data for the training and testing sets into two data tables.    
    -Merge these two tables.   
    -Transform the activity data table into one with meaningful values by applying an anonymous function to each row.    
    -Create list of appropriate columns and extract them from the original data set.    
    -Read in names from the "featureNames" parameter into a data table and assign these to the names of data set columns.     
    -Merge the Activity table to the data set table and assign it a column name.    
    -Merge the Subject table to the data set table and assign it a column name.    
    -Use the dplyr package functionality to create the desired table containing the averages of each variable for each activity and each subject.
2. CodeBook.md - A code book that describes the variables within the data set, what they mean, and any transformations the data went through. 
  
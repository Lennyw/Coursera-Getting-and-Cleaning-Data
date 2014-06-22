##This repo is for the Getting and Cleaning Data Tidy Data course project.

The run_analysis.R script assumes that the data files extracted from the UCI HAR Dataset 
have been moved into the /data/ folder of the working directory.

The HAR Dataset stands for the Human Activity Recognition Using Smartphones Dataset,
which is a collection of data from experiments performed by 30 volunteers performing six
activities, during which time their 3-axial linear acceleration and velocity have been
captured.

This script will read the non-inertial from training and test data into one data frame,
properly assign variable names to each column of measurements, replace the activity
labels with activity descriptions, and take the mean of measurements for each activity
for each subject.

The script will produce a table of the 30 subjects performing 6 activities, and 
measurements for a combined 66 means and standard deviations. These measurements have
been simplified into a tidy dataset.
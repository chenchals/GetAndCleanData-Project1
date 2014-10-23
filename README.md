Human Activity Recognition Using Smartphones Dataset
===========

Data
-----------

The zip file contains data from 30 volunteers aged 19-48 years wearing Samsung Galaxy S II smart phone on the waist. It consists of measurements from embedded accelerometer and gyroscope embedded in a Samsung Galaxy S II smartphone. Measurements were samples at 50Hz in X, Y, and Z planes for linear acceleration and angular velocity.  The dtaa was also partitioned into test (28%) and train (72%) datasets.

Pre-Process data
-----------

The run_analysis.R file pre-process the [raw data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) zip file to create a fully merged dataset that is used in subsequent analyses.

1. Read raw data
1. Create raw data for test and train datasets 
1. Create a full dataset by merging the train and test datasets

### Read raw data
Using `read.table()` and `unz()` functions the following files are read into variables and `data.frame` and merged with the `data.frame()` function.


Extract Mean and Standard deviation of different computed activity measurements
====================

The run_analysis.R file 

Human Activity Recognition Using Smartphones Dataset
===========

Data
-----------

The zip file contains data from 30 volunteers aged 19-48 years wearing Samsung Galaxy S II smart phone on the waist. It consists of measurements from embedded accelerometer and gyroscope embedded in a Samsung Galaxy S II smartphone. Measurements were samples at 50Hz in X, Y, and Z planes for linear acceleration and angular velocity.  The dtaa was also partitioned into test (28%) and train (72%) datasets.

Pre-Process data
-----------

The run_analysis.R file pre-process the [raw data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) zip file to create a fully merged dataset that is used in subsequent analyses.

1. Read raw data
1. Create tidy datasets (train and test) 
1. Create a full dataset by merging the train and test datasets

### Read raw data
Using `read.table()` and `unz()` functions the following files are read into `data.frame` variables and  merged with the `data.frame()` function.
* 'features.txt': List of all 521 features for which data was computed from the accelerometer and gyroscope samples. The `t` and `f` prefixes in the names indicate data computed from either `time-domain` or `frequency-domain` computation methods.
* 'test/subject_train.txt': Id of Subject selected for test dataset. 
* 'test/X_test.txt': Test dataset of 521 variables in 2947 observations.
* 'test/y_test.txt': Labels for test dataset.
* 'train/subject_train.txt': Id of Subject selected for train dataset. 
* 'train/X_train.txt': Train dataset of 521 variables in 7352 observations.
* 'train/y_train.txt': Labels for train dataset.

### Create tidy datasets (train and test)
* Add column names to `XTest or XTrain` variable using values from `features`
* Pre-append the following columns
** `SubjectId`, `TestOr


Extract Mean and Standard deviation of different computed activity measurements
====================

The run_analysis.R file 

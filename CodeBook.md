Variable CodeBook
===============

* Variable `activity` : Values from file 'activity_labels.txt' were used to redefine the descriptions.  These were used to recode the `ActivityLabel` column in the mergedData
* Variable `features` : Values from file 'features.txt' are used as columns names for 'X_test.txt' or 'X_train.txt'
* New column `ActivityLabel` added to mergedData.  The values form 'y_test.txt' or 'y_train.txt' was used for this
* New column `SubjectId` added to mergedData.  The values form 'subject_test.txt' or 'subject_train.txt' was used for this
* New colum `datasetType` added to mergedData. Ste to constant 'test' or 'train' depenfing on the location the file(s) was(were) read from 

* *step-5-means-tidy-data.txt* : Column names correspond to featues described in the dataset.  Only 'Mean' and 'Std' columns were used in computing the means
* *step-5-means-tidy-data.txt* : Column 1: description of activity

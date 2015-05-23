---
title: "CodeBook"
author: "Mohit"
date: "Saturday, May 23, 2015"
---


##### Below is the list of variables with explanation

**xtrain** -- is the variable that contains X_train.txt file after reading 
**ytrain** -- is the variable that contains y_train.txt file after reading
**compl_train** -- combines both xtrain and ytrain in a singel data frame by cbind

**xtest** -- is the variable that contains X_test.txt file after reading
**ytest** -- is the variable that contains Y_test.txt file after reading
**compl_test** -- combines bothe xtest and ytest in a singel data frame by cbind

**wholeData** -- is the variable that row binds the compl_train and compl_test datasets
**feature** -- is the variable that reads features.txt file to get a hold of all column names used in dataset

**mean** -- subsets all the column names that have "mean" in their discription
**std** -- subsets all the column names that have "std" in their discription
**total** -- row binds mean and std data frames to make a single data frame

**totalIndex**  -- subsets the total data frame to take out the column indices for the columns
that contain "mean" or "std" in their discription


**useWholeData** -- subsets wholedata dataset with the help of totalIndex(which contains the indices of useful columns i.e. mean and std)


**averageData** -- contains average of all the measurements across all the 6 activities (walking,walking upstairs, walking downstairs, sitting, standing and laying)

**subset1 to subset6** -- contain subsetted data from useWholeData based on different activities. Total 6 activities so 6 subsets.

**averageMeans_Act1 to averageMeans_Act6** -- contain the average for all the mean and std measurements taken for all the 6 activities. Again 6 activities so 6 results.

##### Code book for column naming

* T -- time
* F -- frequency
* B -- body
* A -- acceleration
* M -- mean
* X -- x coordinate
* Y -- Y coordinate
* Z -- z coordinate
* G -- gyro
* J -- jerk
* Mag -- mag
* Freq -- freq
* std -- std
* Gr -- gravity

##### Transformations used (refer to the code for reference numbers I have provided)

1. Column binding the x_train and y_train data
2. Column binding the x_test and y_test data
3. Merging the two data sets with row binding
5. Total, combines the mean and std data frame extracted from the feature dataframe
7. useWholeData subsets the wholeData based on totalIndex condition. An extra column name "562"                                                 has been provided to include the Activiy_Code which is present in the last column
In the useWholeData last column i.e. Activiy_code column has been converted to factor for
further subsetting.
8. This big chunk of code renames all the columns of the useWholeData data frame.
Code book for interpretting the names has been provided above.
One you go through the codebook interpretting these column names would be fairly easy.
9. This section Provides all the desired averages 




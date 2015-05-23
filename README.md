---
title: "README"
author: "Mohit"
date: "Saturday, May 23, 2015"

---

##### Entire script has been divided into 9 parts 

1. After reading the data in xtrain and ytrain this step combines them to make a single data set called compl_train which is short for complete training data.


2. Same process for test data set too which produces compl_test data set.

3. Merged the training and testing data set to make a complete dataset named wholeData.

4. Reading the feature.txt file to extract the information related to column names.

5. Subsetting the feature data set to extract the entires that contain "mean" and "std" phrases. 
So that they can be used to analyze the mean and std measurements of the main data set.
total data frame combines the mean and std data frames in a single data frame for further uses.

6. Total Index gives the indices of the rows that have "mean" and "std" in their discription

7. Based on total Index wholeData is subsetted to extract all the entries related to mean and std and a new dataframe is formed useWholeData. Besides last column of the wholeData has also been included that contains the activity code. Last column of useWholeData which contains the Active_Code has been converted to "factor" for further uses.

8. In this step all the columns of the final dataset i.e. useWholeData has been renamed according to their discription. For further information refer to the CookBook.Rmd 

9. This part contains the required averages of the measurements.
averageMeas_Activity denotes average of all the activites for that Activity Code and
averageMeans_Act1 to averageMeans_Act6 denote the averages of different activites for all the 6 Activity Codes.

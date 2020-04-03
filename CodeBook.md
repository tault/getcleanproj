---
title: "CodeBook for Ault's Get/Clean Data Project"
author: "Tim Ault"
date: "4/3/2020"
output: html_document
---

# Overview

Detailed line-by-line analysis of this project's main script, run_analysis.R, can be found in the project's README.md which is available at (https://www.coursera.org/learn/data-cleaning/discussions/weeks/4/threads/3GNU_99ZEeedGhKBhw5mhg). This code book provides information about every variable and object created by run_analysis.R, as well as an overview of the columns that can be found in tidy.txt.

# Variables created by run_analysis.R

### ftable
* Created: Line 18
* Class: data.frame
* Dimensions: 561x2
* Description: "raw" read of features.txt using read.table

### features
* Created: Line 19
* Class: character
* Dimensions: 561x1 (vector)
* Description: Column 2 of ftable, as a character vector

### cfeatures
* Created: Line 21
* Class: character
* Dimensions: 561x1 (vector)
* Description: reformatted version of features

### xtest
* Created: Line 22
* Modified: Lines 25, 28, 30
* Class: data.frame
* Dimensions: 2947x563 (eventually)
* Description: read-in of X_test.txt, with two add'l columns added for subjectid and activity

### subtest
* Created: Line 23
* Modified: Line 24
* Class: numeric (eventually)
* Dimensions: 2947x1 (vector)
* Description: read-in of subject_test.txt, reformatted as numeric

### ytest
* Created: Line 26
* Modified: Line 27
* Class: numeric (eventually)
* Dimensions: 2947x1 (vector)
* Description: read-in of y_test.txt, reformatted as numeric

### xtrain
* Created: Line 32
* Modified: Lines 35, 38, 39
* Class: data.frame
* Dimensions: 7352x563 (eventually)
* Description: read-in of X_train.txt, with two add'l columns added for subjectid and activity

### subtrain
* Created: Line 33
* Modified: Line 34
* Class: numeric (eventually)
* Dimensions: 7352x1 (vector)
* Description: read-in of subject_train.txt, reformatted as numeric

### ytrain
* Created: Line 36
* Modified: Line 37
* Class: numeric (eventually)
* Dimensions: 7352x1 (vector)
* Description: read-in of y_train.txt, reformatted as numeric

### merged
* Created: Line 40
* Class: data.frame
* Dimensions: 10299x563
* Description: merge of xtest and xtrain across all columns

### indices
* Created: Line 43
* Class: integer
* Dimensions: 66x1 (vector)
* Description: indices corresponding to columns of merged that we want to keep in next subset

### submerged
* Created: Line 45
* Modified: Lines 47, 48, 49, 50, 51, 52
* Class: data.frame
* Dimensions: 10299x68
* Description: columns of merged with mean and std parameters, plus subjectid and activity

### groupmerge
* Created: Line 57
* Class: grouped_df tbl_df tbl data.frame
* Dimensions: 10299x68
* Description: grouped version of submerge to allow subsequent summarize_at function

### tidy
* Created: Line 58
* Class: grouped_df tbl_df tbl data.frame
* Dimensions: 180x68
* Description: final tidy dataset, which can be viewed or exported as desired

# Column descriptions for tidy.txt

Except for the first two columns, subjectid and activity, information for this section was inferred from UCI's text file, 

### [1] subjectid
This is a numeric index from 1 to 30, assigned by UCI and/or Nike, each corresponding to a different specific volunteer for the experiment.

### [2] activity
This is a character index corresponding to one of six activities that were tested by UCI/Nike in this experiment. Each corresponds to a different activity specified in the activity_labels.txt file: lay corresponds to "LAYING", sit corresponds to "SITTING", stand corresponds to "STANDING", walkdown corresponds to "WALKING_DOWNSTAIRS", walkflat corresponds to "WALKING", and walkup corresponds to "WALKING_UPSTAIRS". 

The original data in X_test.txt and X_train.txt had numeric indices instead of character labels. The mapping between UCI/Nike's character labels and the numeric indices can be found in activity_labels.txt.

### [3] tbodyaccmeanx

This is the mean value of measured value "tBodyAcc-mean()-X" (original features index 1) for every combination of subjectid and activity

### [4] tbodyaccmeany

This is the mean value of measured value "tBodyAcc-mean()-y" (original features index 2) for every combination of subjectid and activity

### [5] tbodyaccmeanz

This is the mean value of measured value "tBodyAcc-mean()-z" (original features index 3) for every combination of subjectid and activity

### [6] tbodyaccstdx

This is the mean value of measured value "tBodyAcc-std()-X" (original features index 4) for every combination of subjectid and activity

### [7] tbodyaccstdy

This is the mean value of measured value "tBodyAcc-std()-y" (original features index 5) for every combination of subjectid and activity

### [8] tbodyaccstdz

This is the mean value of measured value "tBodyAcc-std()-z" (original features index 6) for every combination of subjectid and activity

### [9] tgravityaccmeanx

This is the mean value of measured value "tGravityAcc-mean()-X" (original features index 41) for every combination of subjectid and activity

### [10] tgravityaccmeany

This is the mean value of measured value "tGravityAcc-mean()-y" (original features index 42) for every combination of subjectid and activity

### [11] tgravityaccmeanz

This is the mean value of measured value "tGravityAcc-mean()-z" (original features index 43) for every combination of subjectid and activity

### [12] tgravityaccstdx

This is the mean value of measured value "tGravityAcc-std()-X" (original features index 44) for every combination of subjectid and activity 
### [13] tgravityaccstdy

This is the mean value of measured value "tGravityAcc-std()-y" (original features index 45) for every combination of subjectid and activity

### [14] tgravityaccstdz

This is the mean value of measured value "tGravityAcc-std()-z" (original features index 46) for every combination of subjectid and activity

### [15] tbodyaccjerkmeanx

This is the mean value of measured value "tBodyAccJerk-mean()-X" (original features index 81) for every combination of subjectid and activity

### [16] tbodyaccjerkmeany

This is the mean value of measured value "tBodyAccJerk-mean()-y" (original features index 82) for every combination of subjectid and activity

### [17] tbodyaccjerkmeanz

This is the mean value of measured value "tBodyAccJerk-mean()-z" (original features index 83) for every combination of subjectid and activity

### [18] tbodyaccjerkstdx

This is the mean value of measured value "tBodyAccJerk-std()-X" (original features index 84) for every combination of subjectid and activity

### [19] tbodyaccjerkstdy

This is the mean value of measured value "tBodyAccJerk-std()-y" (original features index 85) for every combination of subjectid and activity

### [20] tbodyaccjerkstdz

This is the mean value of measured value "tBodyAccJerk-std()-z" (original features index 86) for every combination of subjectid and activity

### [21] tbodygyromeanx

This is the mean value of measured value "tBodyGyro-mean()-X" (original features index 121) for every combination of subjectid and activity

### [22] tbodygyromeany

This is the mean value of measured value "tBodyGyro-mean()-y" (original features index 122) for every combination of subjectid and activity

### [23] tbodygyromeanz

This is the mean value of measured value "tBodyGyro-mean()-z" (original features index 123) for every combination of subjectid and activity

### [24] tbodygyrostdx

This is the mean value of measured value "tBodyGyro-std()-X" (original features index 124) for every combination of subjectid and activity

### [25] tbodygyrostdy

This is the mean value of measured value "tBodyGyro-std()-y" (original features index 125) for every combination of subjectid and activity

### [26] tbodygyrostdz

This is the mean value of measured value "tBodyGyro-std()-z" (original features index 126) for every combination of subjectid and activity

### [27] tbodygyrojerkmeanx

This is the mean value of measured value "tBodyGyroJerk-mean()-X" (original features index 161) for every combination of subjectid and activity

### [28] tbodygyrojerkmeany

This is the mean value of measured value "tBodyGyroJerk-mean()-y" (original features index 162) for every combination of subjectid and activity

### [29] tbodygyrojerkmeanz

This is the mean value of measured value "tBodyGyroJerk-mean()-z" (original features index 163) for every combination of subjectid and activity

### [30] tbodygyrojerkstdx

This is the mean value of measured value "tBodyGyroJerk-std()-X" (original features index 164) for every combination of subjectid and activity

### [31] tbodygyrojerkstdy

This is the mean value of measured value "tBodyGyroJerk-std()-y" (original features index 165) for every combination of subjectid and activity

### [32] tbodygyrojerkstdz

This is the mean value of measured value "tBodyGyroJerk-std()-z" (original features index 166) for every combination of subjectid and activity

### [33] tbodyaccmagmean

This is the mean value of measured value "tBodyAccMag-mean()" (original features index 201) for every combination of subjectid and activity

### [34] tbodyaccmagstd

This is the mean value of measured value "tBodyAccMag-std()" (original features index 202) for every combination of subjectid and activity

### [35] tgravityaccmagmean

This is the mean value of measured value "tGravityAccMag-mean()" (original features index 214) for every combination of subjectid and activity

### [36] tgravityaccmagstd

This is the mean value of measured value "tGravityAccMag-std()" (original features index 215) for every combination of subjectid and activity

### [37] tbodyaccjerkmagmean

This is the mean value of measured value "tBodyAccJerkMag-mean()" (original features index 227) for every combination of subjectid and activity

### [38] tbodyaccjerkmagstd

This is the mean value of measured value "tBodyAccJerkMag-std()" (original features index 228) for every combination of subjectid and activity

### [39] tbodygyromagmean

This is the mean value of measured value "tBodyGyroMag-mean()" (original features index 240) for every combination of subjectid and activity

### [40] tbodygyromagmean

This is the mean value of measured value "tBodyGyroMag-std()" (original features index 241) for every combination of subjectid and activity

### [41] tbodygyrojerkmagmean

This is the mean value of measured value "tBodyGyroJerkMag-mean()" (original features index 253) for every combination of subjectid and activity

### [42] tbodygyrojerkmagstd

This is the mean value of measured value "tBodyGyroJerkMag-std()" (original features index 254) for every combination of subjectid and activity

### [43] fbodyaccmeanx

This is the mean value of measured value "fBodyAcc-mean()-X" (original features index 266) for every combination of subjectid and activity

### [44] fbodyaccmeany

This is the mean value of measured value "fBodyAcc-mean()-y" (original features index 267) for every combination of subjectid and activity

### [45] fbodyaccmeanz

This is the mean value of measured value "fBodyAcc-mean()-z" (original features index 268) for every combination of subjectid and activity

### [46] fbodyaccstdx

This is the mean value of measured value "fBodyAcc-std()-X" (original features index 269) for every combination of subjectid and activity

### [47] fbodyaccstdy

This is the mean value of measured value "fBodyAcc-std()-y" (original features index 270) for every combination of subjectid and activity

### [48] fbodyaccstdz

This is the mean value of measured value "fBodyAcc-std()-z" (original features index 271) for every combination of subjectid and activity

### [49] fbodyaccjerkmeanx

This is the mean value of measured value "fBodyAccJerk-mean()-X" (original features index 345) for every combination of subjectid and activity

### [50] fbodyaccjerkmeany

This is the mean value of measured value "fBodyAccJerk-mean()-y" (original features index 346) for every combination of subjectid and activity

### [51] fbodyaccjerkmeanz

This is the mean value of measured value "fBodyAccJerk-mean()-z" (original features index 347) for every combination of subjectid and activity

### [52] fbodyaccjerkstdx

This is the mean value of measured value "fBodyAccJerk-std()-X" (original features index 348) for every combination of subjectid and activity

### [53] fbodyaccjerkstdy

This is the mean value of measured value "fBodyAccJerk-std()-y" (original features index 349) for every combination of subjectid and activity

### [54] fbodyaccjerkstdz

This is the mean value of measured value "fBodyAccJerk-std()-z" (original features index 350) for every combination of subjectid and activity

### [55] fbodygyromeanx

This is the mean value of measured value "fBodyGyro-mean()-X" (original features index 424) for every combination of subjectid and activity

### [56] fbodygyromeanx

This is the mean value of measured value "fBodyGyro-mean()-y" (original features index 425) for every combination of subjectid and activity

### [57] fbodygyromeanx

This is the mean value of measured value "fBodyGyro-mean()-z" (original features index 426) for every combination of subjectid and activity

### [58] fbodygyrostdx

This is the mean value of measured value "fBodyGyro-std()-X" (original features index 427) for every combination of subjectid and activity

### [59] fbodygyrostdy

This is the mean value of measured value "fBodyGyro-std()-y" (original features index 428) for every combination of subjectid and activity

### [60] fbodygyrostdz

This is the mean value of measured value "fBodyGyro-std()-z" (original features index 429) for every combination of subjectid and activity

### [61] fbodyaccmagmean

This is the mean value of measured value "fBodyAccMag-mean()" (original features index 503) for every combination of subjectid and activity

### [62] fbodyaccmagstd

This is the mean value of measured value "fBodyAccMag-std()" (original features index 504) for every combination of subjectid and activity

### [63] fbodybodyaccjerkmagmean

This is the mean value of measured value "fBodyBodyAccJerkMag-mean()" (original features index 516) for every combination of subjectid and activity

### [64] fbodybodyaccjerkmagstd

This is the mean value of measured value "fBodyBodyAccJerkMag-std()" (original features index 517) for every combination of subjectid and activity

### [65] fbodybodygyromagmean

This is the mean value of measured value "fBodyBodyGyroMag-mean()" (original features index 529) for every combination of subjectid and activity

### [66] fbodybodygyromagstd

This is the mean value of measured value "fBodyBodyGyroMag-std()" (original features index 530) for every combination of subjectid and activity

### [67] fbodybodygyrojerkmagmean

This is the mean value of measured value "fBodyBodyGyroJerkMag-mean()" (original features index 542) for every combination of subjectid and activity

### [68] fbodybodygyrojerkmagstd

This is the mean value of measured value "fBodyBodyGyroJerkMag-std()" (original features index 543) for every combination of subjectid and activity
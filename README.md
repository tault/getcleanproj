---
title: "README for Ault's Get/Clean Data Project"
author: "Tim Ault"
date: "4/3/2020"
output: html_document
---

# Introduction

This README is meant to accompany Tim Ault's submission for JHU's Coursera course, "Getting and Cleaning Data". It is accompanied by a script "run_analysis.R", a text file containing the ultimate product "tidy.txt", and an accompanying code book "CodeBook.md". This README file and accompanying scripts and data submissions can be found at https://github.com/tault/getcleanproj.

Please see the accompanying codebook "CodeBook.md" for a description of each variable or object created by run_analysis.R, as well as a description of each column in tidy.txt.

# Requisite Data and Directories

This project is based on data that was originally developed at UC Irvine but was made available for this course. The original data is located at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones, but the version of the data used for this course is located at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

When unzipped, the data includes four .txt files (activity_labels, features, features_info, and README) and two folders "test" and "train". The "test" folder contains three .txt files (subject_test,X_test,y_test) and a folder called "Inertial Signals". The "train" folder also contains three .txt files (subject_train,X_train,y_train) and a folder "Inertial Signals". For this project, we did not use the data within the "Inertial Signals" folders. The run_analysis script explicitly reads features, subject_test, X_test, y_test, subject_train, X_train, and y_train. The script does not explicitly read activity_labels, but knowledge of this file was essential for crafting lines 40-45 of run_analysis.

To use run_analysis, you will need to have the seven required text files stored in your working directory. Lines 4-17 of run_analysis, currently commented, can be used to download the requisite the files and create the necessary directory structure to run the rest of the code if you have not already done this.

# Walking Through the Script

Assuming you have unzipped the required files and placed them in the correct folders as described above, the first uncommented line in run_analysis begins on Line 18.

## Lines 18-21: Reading/formatting the "features" labels

This is really just three lines of code since Line 20 is a comment. Line 18 reads in features.txt with elements separated by a space. features.txt is basically two columns of data, with the first column being a numeric ID from 1...561 and the second column being the actual data labels we care about. Line 19 subsets only this second column and converts them to characters, which is necessary to use gsub() and tolower() for subsequent cleaning on Line 21. The labels are already very descriptive, so Line 15 simply uses gsub() to get rid of periods, dashes, and empty parenthesis pairs ("()"), and tolower() to get rid of upper case letters. Now we have a character vector of clean data labels called cfeatures.

## Lines 22-39: Reading in the test and training data

Both X_test.txt and X_train.txt consist of numbers that occupy 16-character blocks (with either 1 or 2 of those blocks being spaces depending on whether the number is negative or not). Read.fwf() is useful here so we can read-in these fixed-width elements. It requires us to specify an entire vector of widths or else read.fwf() will just count out a single time. There are 561 values per row (one corresponding to each label in cfeatures), so we use rep(16,561) as the widths index.

Starting with X_test.txt, after Line 22 we now have a table "xtest with 2947 rows and 561 columns, but we actually also want two more columns for the volunteer's ID number (specified in subject_test.txt) and the activity ID number (specified in y_test). Line 23 reads in subject_test.txt, and it results in an integer vector which, as I learned the hard way, does not play particularly nicely with merge() later on. So, in Line 24 we convert the whole thing to a numeric vector instead. Once it's numeric, in Line 25 we roll the whole thing into a column of xtest with the label "subjectid". Lines 26-28 repeat the same procedure but for y_test, with the label "activity". In one final command, Line 30 (lines 29 & 31 are comments), we order the columns so that the subject id and activity data comes first.

Lines 32-39 do the exact same thing and follow the exact same format as Lines 22-30, except for the training data.

## Lines 40-52: Merging and selecting the columns we want

At this point we have two data frames, xtest and xtrain, that each have exactly 563 columns with exactly the same labels. Therefore, the merge in Row 40 is basically just a row bind where we copy and paste all the training rows beneath the test rows. Now we have a dataframe "merged" with 10299 rows and 563 columns.

In Line 43 (41-42 are comments), we use grep to select only the column names we want, i.e., only the ones that end with mean or std, or with something like "meanx" or "stdz". Like many of you, I struggled to decide whether to include those columns with either meanFreq or those angle ones at the end. Ultimately, I discovered this post in the discussion (https://www.coursera.org/learn/data-cleaning/discussions/weeks/4/threads/3GNU_99ZEeedGhKBhw5mhg) where mentor Len Greski says that he did NOT include the mean frequency or the angle parameters in his own version. The initial grep command doesn't pick up the meanFreq variables because they didn't END with mean, but it does pick up the angle values. To exclude these, we combine that with a second grep command where we look for parameters that begin with "angle" and then flip the logic on that command by setting invert=TRUE. By taking the intersection of these two grep commands, we effectively look for only columns that end in mean but do NOT start with angle.

In Line 45 (44 is a comment), we subset our merged table using the indices we found in Line 44, as well as our first two index-like columns, subjectid and activity. Now we have a dataframe "submerged" with 10299 rows and 68 columns.

After a comment on Line 46, Lines 47-52 simply give replace the numeric indices for "activity" with more descriptive character labels. We don't explicitly call or read "activity_labels.txt", but these labels are based on the description in that file.

At this point, if you we have a descriptive data frame with a row for every data trial. Rows 53-55 are comments, but Line 55 could be used to write the "submerged" data frame as a text file if it were desired. 

## Lines 56-59: Merging and selecting the columns we want

Line 56 just puts the dplyr package in the library, in case it hasn't already been done.

Line 57 groups our merged table by subjectid and activity, which allows Line 58 to take the means of our data for every combination of subjectid and activity. We use summarize_at() because we want to take the mean of ALMOST all columns, but not the first two. Thankfully, summarize_at() allows us to set this "vars" index where we can name all the columns that we want to operate the function on. The resulting data frame, "tiny", has 180 rows and 68 columns.

Finally, in Line 59, we use write.table to save "tidy" as a .txt file with no row names.
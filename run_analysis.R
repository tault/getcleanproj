## Some comments here, but for more details see README.md and CodeBook.md
## This script assumes you already have the required unzipped files located in a directory "uci".
## Directory "uci" is located in another directory "data" within your working directory.
## However, if you do not yet have these files or directories, you can run the code immediately below:
##if (!file.exists("data")){
##  dir.create("data")
##}
##fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
##download.file(fileURL,"./data/zippety.zip)
##unzip(".data/zippety.zip",exdir="./data)
#file.rename("./data/UCI HAR Dataset","./data/uci")
ftable<-read.table("./data/uci/features.txt",sep=" ")
features<-as.character(ftable$V2)
## Remove upper case, periods, dashes, and random parantheses pairs from column names
cfeatures<-gsub("\\.","",gsub("-","",gsub("\\()","",tolower(features))))
xtest<-read.fwf("./data/uci/test/X_test.txt",rep(16,561),col.names=cfeatures)
subtest<-read.table("./data/uci/test/subject_test.txt")
subtest<-as.numeric(subtest[[1]])
xtest$subjectid<-subtest
ytest<-read.table("./data/uci/test/y_test.txt")
ytest<-as.numeric(ytest[[1]])
xtest$activity<-ytest
## Reorder columns to have subjectid and activity first
xtest<-xtest[c(562,563,1:561)]
## Repeat previous steps for training data
xtrain<-read.fwf("./data/uci/train/X_train.txt",rep(16,561),col.names=cfeatures)
subtrain<-read.table("./data/uci/train/subject_train.txt")
subtrain<-as.numeric(subtrain[[1]])
xtrain$subjectid<-subtrain
ytrain<-read.table("./data/uci/train/y_train.txt")
ytrain<-as.numeric(ytrain[[1]])
xtrain$activity<-ytrain
xtrain<-xtrain[c(562,563,1:561)]
merged<-merge(xtest,xtrain,all=TRUE)
## Deliberately take mean and std columns, but exclude those weird angle ones at the end (course mentor advised not to include those)
indices<-intersect(grep("mean$|meanx$|meany$|meanz$|std$|stdx$|stdy$|stdz$",colnames(merged)),grep("^angle",colnames(merged),invert=TRUE))
##Keep the subjectid and activity columns, along with the 66 mean & std columns of interest
submerged<-merged[c(1,2,indices)]
## Replace original "y" IDs with more descriptive labels
submerged$activity<-gsub("1","walkflat",submerged$activity)
submerged$activity<-gsub("2","walkup",submerged$activity)
submerged$activity<-gsub("3","walkdown",submerged$activity)
submerged$activity<-gsub("2","walkup",submerged$activity)
submerged$activity<-gsub("4","sit",submerged$activity)
submerged$activity<-gsub("5","stand",submerged$activity)
submerged$activity<-gsub("6","lay",submerged$activity)
## At this point, submerged is the "full" table corresponding to the end of project step 4
## If you prefer to have this data instead of the tidy data, use the following code:
##write.table(submerged,"./data/full.txt",row.names=FALSE)
library(dplyr)
groupmerge<-group_by(submerged,subjectid,activity)
tidy<-summarize_at(groupmerge,vars(tbodyaccmeanx:fbodybodygyrojerkmagstd),mean)
write.table(tidy,"./data/tidy.txt",row.names=FALSE)
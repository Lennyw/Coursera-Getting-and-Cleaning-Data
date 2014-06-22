##Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

##This script assumes the contents of the UCI HAR Dataset have been moved into the /data/ folder of
##the working directory.

##This script was created with the intention of being easy to understand and does not necessarily
##represent the most efficient, compact, or functional way of performing these actions.
##move this bit to the readme.md.

data<-rbind(cbind(read.table("data/train/subject_train.txt"),
                  read.table("data/train/y_train.txt"),
                  read.table("data/train/X_train.txt")),
            cbind(read.table("data/test/subject_test.txt"), 
                  read.table("data/test/y_test.txt"), 
                  read.table("data/test/X_test.txt")))
##1. First we pull all the data into one data frame to make it easier to work with.

features<-read.table("data/features.txt", colClasses = "character")["V2"]
features<-as.vector(features$V2)
features<-c("Subject","Label",features)
colnames(data)<-features
##4. We take the column names from features.txt and apply them to our dataset.

meanstd<-grep("-mean\\(\\)|-std\\(\\)",features)
##2a. Use grep to create a vector from the mean and std columns we want to target.

data<-data[,c(1,2,meanstd)]
##2b. We trim our data set to the columns we specified for mean and standard deviation measurements.

activities<-read.table("data/activity_labels.txt", stringsAsFactors=FALSE)
data$Label <- factor(data$Label, labels=activities$V2)
##3. We read the activities and then use factor() to replace the numbers used in data$Label with
##the corresponding activity descriptor. This works for the way the original set of data was organized.


tidy<-melt(data, id.vars=c("Subject","Label"))
tidy<-dcast(tidy, Subject+Label ~ variable, mean)
##5. We collapse the different mean and std variables into one column then find the means for the
##variables that have the same subject and activity label, then reexpand.

write.table(tidy, "tidy.txt", row.names = FALSE, col.names = TRUE)
#1.Merges the training and the test sets to create one data set.
X_test=read.table("~/Dropbox/Study/Coursera/Cleaning data/UCI HAR Dataset/test/X_test.txt", quote="\"")
X_train=read.table("~/Dropbox/Study/Coursera/Cleaning data/UCI HAR Dataset/train/X_train.txt", quote="\"")
X=rbind(X_test,X_train)

#2.Extracts only the measurements on the mean and standard deviation for each measurement. 
Mean=as.matrix(sapply(X,mean))
Std=as.matrix(sapply(X,sd))
Measurements=cbind(Mean,Std)
colnames(Measurements)=c("Mean","Std")

#3.Uses descriptive activity names to name the activities in the data set.
y_test=read.table("~/Dropbox/Study/Coursera/Cleaning data/UCI HAR Dataset/test/y_test.txt", quote="\"")
y_train=read.table("~/Dropbox/Study/Coursera/Cleaning data/UCI HAR Dataset/train/y_train.txt", quote="\"")
y=rbind(y_test,y_train)
colnames(y)="activity_labels"
Xy=cbind(y,X)

activity_labels=read.table("~/Dropbox/Study/Coursera/Cleaning data/UCI HAR Dataset/activity_labels.txt", quote="\"")
colnames(activity_labels)=c("activity_labels","activity")
Xy_activity=merge(activity_labels,Xy,by.x="activity_labels",by.y="activity_labels")

#4.Appropriately labels the data set with descriptive variable names. 
feature_names=read.table("~/Dropbox/Study/Coursera/Cleaning data/UCI HAR Dataset/features.txt", quote="\"")
extra=c("activity_labels","activity")
feature_names=as.character(feature_names[,2])
variable_names=c(extra,feature_names)
colnames(Xy_activity)=variable_names

#5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
subject_test=read.table("~/Dropbox/Study/Coursera/Cleaning data/UCI HAR Dataset/test/subject_test.txt", quote="\"")
subject_train=read.table("~/Dropbox/Study/Coursera/Cleaning data/UCI HAR Dataset/train/subject_train.txt", quote="\"")
subject=rbind(subject_test,subject_train)
colnames(subject)="subject"
Xy_activity_subject=cbind(subject,Xy_activity)

activity=as.matrix(Xy_activity_subject[3])
activity=as.factor(activity)
subject=as.matrix(Xy_activity_subject[1])
subject=as.factor(subject)
s=split(Xy_activity_subject,list(subject,activity),drop=TRUE)
tidydata=as.data.frame(sapply(s,function(x) colMeans(x[,4:length(Xy_activity_subject)],na.rm=TRUE)))
write.table(tidydata,file="tidydata.txt")

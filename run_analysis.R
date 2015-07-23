## This script reads motion activity data of 30 users using a samsung phone's hardware
## The data will be consolidated and principles of tidy data will be applied
## Place this script in your R working directory along with the data folder named
## "UCI HAR Dataset"

library(dplyr)
library(reshape2)

################################################################
#
#Read training data
#
################################################################

#Read Training variables from X_train
train_feature_raw <-read.table(file="UCI\ HAR\ Dataset/train/X_train.txt",header=FALSE,colClasses="character",strip.white = TRUE)
print(paste("X Train: ",nrow(train_feature_raw)," records read for a total of ",ncol(train_feature_raw)," variables"))

#Read Training variables from Y_train
activity_train_raw <-read.table(file="UCI\ HAR\ Dataset/train/y_train.txt",header=FALSE,strip.white = TRUE)
print(paste("Y Train (Activity data): ",nrow(activity_train_raw)," records read for a total of ",ncol(activity_train_raw)," variables"))

activity_train_raw<-rename(activity_train_raw,activity_num=V1)

#Read Training variables from subject_train
subject_train_raw <-read.table(file="UCI\ HAR\ Dataset/train/subject_train.txt",header=FALSE,strip.white = TRUE)
print(paste("Subject Train: ",nrow(subject_train_raw)," records read for a total of ",ncol(subject_train_raw)," variables"))
subject_train_raw<-rename(subject_train_raw,subjectNum=V1)



################################################################
#
#Read Test data
#
################################################################

#Read Training variables from X_train
test_feature_raw <-read.table(file="UCI\ HAR\ Dataset/test/X_test.txt",header=FALSE,colClasses="character",strip.white = TRUE)
print(paste("X_Test (Test data): ",nrow(test_feature_raw)," records read for a total of ",ncol(test_feature_raw)," variables"))

#Read Training variables from Y_train
activity_test_raw <-read.table(file="UCI\ HAR\ Dataset/test/y_test.txt",header=FALSE,strip.white = TRUE)
print(paste("Y Test (Activity Data): ",nrow(activity_test_raw)," records read for a total of ",ncol(activity_test_raw)," variables"))
activity_test_raw<-rename(activity_test_raw,activity_num=V1)

#Read Training variables from subject_train
subject_test_raw <-read.table(file="UCI\ HAR\ Dataset/test/subject_test.txt",header=FALSE,strip.white = TRUE)
print(paste("Subject Test (Subject Data): ",nrow(subject_test_raw)," records read for a total of ",ncol(subject_test_raw)," variables"))
subject_test_raw<-rename(subject_test_raw,subjectNum=V1)


## Read general files
activity <-read.table(file="UCI\ HAR\ Dataset/activity_labels.txt",header=FALSE,strip.white = TRUE)
print(paste("Activity labels Data): ",nrow(activity)," records read for a total of ",ncol(activity)," variables"))
activity<-rename(activity,act_num=V1,activityName=V2)

## Read features variables list
feature_list <-read.table(file="UCI\ HAR\ Dataset/features.txt",header=FALSE,colClasses="character",strip.white = TRUE)
print(paste("List of Features Data): ",nrow(feature_list)," records read for a total of ",ncol(feature_list)," variables"))
feature_list<-rename(feature_list,f_num=V1,f_name=V2)

##Rename training and test sets with feature column names
print("Rename training and test sets with feature column names")
for (i in 1:length(feature_list$f_num)){
    if(i==as.numeric(feature_list$f_num[i])) {
        colnames(test_feature_raw)[i]=feature_list$f_name[i]
    }
    if(i==as.numeric(feature_list$f_num[i])) {
        colnames(train_feature_raw)[i]=feature_list$f_name[i]
    }
}

print("Combining Training Data from multiple files")
train<-cbind(subject_train_raw,activity_train_raw,train_feature_raw)


print("Combining Test Data from multiple files")
test<-cbind(subject_test_raw,activity_test_raw,test_feature_raw)

print("combining Test and Train data")
full_train_test <- rbind(train,test)

##Fetch Activity Names using activity numbers
full_train_test<-merge(activity,full_train_test,by.x="act_num",by.y="activity_num")
full_train_test<-subset(full_train_test, select=-act_num)
print("Activity names tagged!")

## Column names cleanup
subset_motion_data<-select(full_train_test,contains("activityName"),contains("subjectNum"),contains("-mean()"),contains("-std()"))
colnames(subset_motion_data)<-gsub("-mean","Mean",colnames(subset_motion_data))
colnames(subset_motion_data)<-gsub("-std","StdDev",colnames(subset_motion_data))
colnames(subset_motion_data)<-gsub("Mag","Mgntude",colnames(subset_motion_data))
colnames(subset_motion_data)<-gsub("\\(|\\)|\\-","",colnames(subset_motion_data))
colnames(subset_motion_data)<-gsub("^t","time",colnames(subset_motion_data))
colnames(subset_motion_data)<-gsub("^f","freq",colnames(subset_motion_data))
print("Column names cleaned and standardized!")

##Converting data to long form
motion_Data_Long<-melt(subset_motion_data,id.vars=c("activityName","subjectNum")
           ,variable.name = "featureName", 
           value.name = "featureValue")
print("Long form of the motion data created!")

## Output to a CSV file backup
write.csv(motion_Data_Long,file="output_long_data.csv",append=FALSE)
print("CSV file backup created in the R project working director. Use this for verification or  troubleshooting")

## Data is aggregated (mean) for all features
motion_data_aggregate<-motion_Data_Long %>% group_by(activityName,subjectNum,featureName) %>% summarize(featureMean=mean(as.numeric(featureValue)))
print("Mean is calcuated for all features, for every subject and activity")

write.table(motion_data_aggregate,file="project_submit.txt",row.name=FALSE)

print("Text output file create!Process Complete!")

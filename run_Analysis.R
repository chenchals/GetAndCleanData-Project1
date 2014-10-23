## Read contents from the zip file into variables
library(plyr)
library(lattice)
library(reshape2)
library(car)

## Read data from the zip file
sourceZip<-tempfile()
download.file("file://getdata-projectfiles-UCI HAR Dataset.zip",sourceZip)
features <- read.table(unz(sourceZip, "UCI HAR Dataset/features.txt"))
activity <- read.table(unz(sourceZip, "UCI HAR Dataset/activity_labels.txt"))
names(features)<-c("featureIndex","featureName")

for(testRTrain in c("test","train")){
  subjectData <- read.table(unz(sourceZip, paste("UCI HAR Dataset/",testRTrain,"/subject_",testRTrain ,".txt",sep="")))
  XData <- read.table(unz(sourceZip, paste("UCI HAR Dataset/",testRTrain,"/X_",testRTrain ,".txt",sep="")))
  YData <- read.table(unz(sourceZip, paste("UCI HAR Dataset/",testRTrain,"/y_",testRTrain ,".txt",sep="")))
  ##Merge data frames for features, subjects, test/train sampling ids and subjectIds
  rowId<-c(1:nrow(XData))
  datasetType<-rep(testRTrain,each = nrow(XData))
  names(subjectData)<-"SubjectId"
  names(XData)<-features[,2]
  names(YData)<-"ActivityLabel"
  #use testOrTrainRowId to track later
  if(testRTrain=="test"){
    testDataset<-data.frame(datasetType=datasetType,testOrTrainRowId=rowId,subjectData,YData,XData)
  }else{
    trainDataset<-data.frame(datasetType=datasetType,testOrTrainRowId=rowId,subjectData,YData,XData)
  }
  #reclaim space
  rm(XData,YData,subjectData,datasetType,rowId)
}
unlink(sourceZip)
#reclaim space
rm(testRTrain,sourceZip)
## Merge the test and train data sets
mergedData<-rbind(testDataset,trainDataset)
#create new observationId for each row
mergedData<-data.frame(observationId=c(1:nrow(mergedData)),mergedData)
#recode the activity label
mergedData$ActivityLabel<-factor(recode(mergedData$ActivityLabel, "1='Walking';2='Walking Upstairs';3='Walking downstairs';4='Sitting';5='Standing';6='Laying'"))
# write.table(mergedData, "tidy-data.txt", row.names=FALSE)
# reclaim space
rm(testDataset,trainDataset)
# find index into column names for extracting data from merged set
columnIndicesToExtract<-which(regexpr(pattern = ".*(mean|std).*",ignore.case = TRUE,text=names(mergedData))>0)
# extract along with reference columns to the original data
extractedData<-mergedData[,c(5,columnIndicesToExtract)]
# means of columns
meansExtracted<-ddply(extractedData, .(ActivityLabel), numcolwise(mean))
write.table(meansExtracted, "step5-means-tidy-data.txt", row.names=FALSE)








## Read contents from the zip file into variables
library(plyr)
sourceZip<-tempfile()
download.file("file://getdata-projectfiles-UCI HAR Dataset.zip",sourceZip)
features <- read.table(unz(sourceZip, "UCI HAR Dataset/features.txt"))
names(features)<-c("featureIndex","featureName")

for(testRTrain in c("test","train")){
  subjectData <- read.table(unz(sourceZip, paste("UCI HAR Dataset/",testRTrain,"/subject_",testRTrain ,".txt",sep="")))
  XData <- read.table(unz(sourceZip, paste("UCI HAR Dataset/",testRTrain,"/X_",testRTrain ,".txt",sep="")))
  YData <- read.table(unz(sourceZip, paste("UCI HAR Dataset/",testRTrain,"/y_",testRTrain ,".txt",sep="")))
  ##Merge data frames
  rowId<-c(1:nrow(subjectData))
  datasetType<-data.frame(datasetType=rep(testRTrain,each = nrow(XData)))
  names(subjectData)<-"SubjectId"
  names(XData)<-features[,2]
  names(YData)<-"Test/Train-Label"
  #use testOrTrainRowId to track later
  if(testRTrain=="test"){
    testDataset<-data.frame(testOrTrainRowId=rowId,datasetType,subjectData,YData,XData)
  }else{
    trainDataset<-data.frame(testOrTrainRowId=rowId,datasetType,subjectData,YData,XData)
  }
  #reclaim space
  rm(XData,YData,subjectData,datasetType,rowId)
}
unlink(sourceZip)
#reclaim space
rm(testRTrain,sourceZip)
mergedData<-rbind(testDataset,trainDataset)
#create new observationId for each row
mergedData<-data.frame(observationId=c(1:nrow(mergedData)),mergedData)
#reclaim space
rm(testDataset,trainDataset)
# find index into column names for extracting data from merged set
columnIndicesToExtract<-which(regexpr(pattern = ".*(mean|std).*",ignore.case = TRUE,text=names(mergedData))>0)
# extract along with reference columns to the original data
extractedData<-mergedData[,c(c(1:5),columnIndicesToExtract)]
# means of columns
meansExtractedData<-sapply(extractedData[,c(6:ncol(extractedData))],FUN = mean)
write.table(meansExtractedData, "step5-means-tidy-data.txt",row.names=FALSE)







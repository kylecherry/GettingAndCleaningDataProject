run_analysis <- function(trainingFile,testingFile,featureNames, trainY, testY, subjectTrain, subjectTest){
  trainDT <- read.table(trainingFile)#read in train data
  testDT <- read.table(testingFile)#read in test data
  dataSet <- rbind(trainDT,testDT)#merge datasets into one
  trainYDT <- read.table(trainY)#read Y values for train set
  testYDT <- read.table(testY)#read Y values for test set
  mergedY <- rbind(trainYDT,testYDT)#merge the Y's together
  trainSubject <- read.table(subjectTrain)#read subject data for training set
  testSubject <- read.table(subjectTest)#read subject data for testing set
  mergedSubjects <- rbind(trainSubject,testSubject)#merge subjects for each set into one
  mergedY <- apply(mergedY,1, function(x){ #apply an anonomous function to change "1-6" into meaningful values
    ifelse(x==1,val<-"Walking", 
           ifelse(x == 2,val<-"Walking Upstairs",
                  ifelse(x==3,val<-"Walking Downstairs",
                        ifelse(x == 4,val<-"Sitting",
                               ifelse(x==5,val<-"Standing", 
                                      ifelse(TRUE,val<-"Laying",FALSE) )))))
    val})
  columnsToUse <- c(1:6,41:46,81:86,121:126,161:166,201:202,214:215,227:228,240:241,253:254,266:271,294:296,345:350,373:375,424:429,452:454,503:504,513,516:517,526,529:530,539,542:543,552)
  dataSet <- dataSet[,columnsToUse]#extract mean/std features from dataSet
  featureNamesDT <- read.table(featureNames, stringsAsFactors = FALSE)#read in feature names as characters
  featureNamesDT <- featureNamesDT[columnsToUse,2] #edit table to only contain 2nd column (the names) of the mean/std variables
  names(dataSet) = featureNamesDT #set meaningful names to the variables in dataSet
  dataSet <- cbind(mergedY,dataSet) #merge the single column activty table to the front of the dataSet.
  names(dataSet)[1] <- "Activity" #rename the newly added column
  dataSet <- cbind(mergedSubjects, dataSet)#merge the single column subject table to the front of the dataSet.
  names(dataSet)[1] <- "Subject" #rename the newly added column
  write.table(dataSet %>% group_by(Activity, Subject) %>% summarise_each(funs(mean)), file = "tidyDataSet.txt", row.names=FALSE)#create the table and write it to file
}
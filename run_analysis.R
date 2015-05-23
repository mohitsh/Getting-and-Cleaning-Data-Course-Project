
library(dplyr)

##0
xtrain <- read.table("UCI HAR Dataset/train/X_train.txt", header=F)
ytrain <- read.table("UCI HAR Dataset/train/y_train.txt", header=F)

##1
compl_train <- cbind(xtrain,ytrain)

xtest <- read.table("UCI HAR Dataset/test/X_test.txt", header=F)
ytest <- read.table("UCI HAR Dataset/test/y_test.txt", header=F)

##2
compl_test <- cbind(xtest, ytest)

##3
wholeData <-  rbind(compl_train, compl_test)

##4 
feature <- read.table("UCI HAR Dataset/features.txt", header=F)


##5
mean <- feature[grep("mean", feature$V2), ]
std <-  feature[grep("std", feature$V2), ]

##5
total <- rbind(mean, std)

meanIndex <- mean$V1
stdIndex <- std$V1

##6
totalIndex <- total$V1


##7
useWholeData <- wholeData[,c(totalIndex, 562)]
useWholeData[,80] <- as.factor((useWholeData[,80]))

##8
useWholeData <- rename(useWholeData,  TBAM_X = V1, TBAM_Y = V2,  
                       TBAM_Z = V3,
                       TGAM_X = V41, TGAM_Y = V42, TGAM_Z= V43,
                       TBAJM_X = V81,TBAJM_Y = V82, TBAJM_Z = V83,
                       TBGM_X = V121, TBGM_Y = V122, TBGM_Z = V123,
                       TBGJM_X = V161,TBGJM_Y = V162, TBGJM_Z = V163,
                       TBAMagM = V201, TGAMagM= V214, TBAJMagM = V227,
                       TBGMagM = V240,  TBGJMagM = V253, 
                       FBAM_X = V266, FBAM_Y = V267, FBAM_Z = V268,
                       FBAMFreq_X = V294, FBAMFreq_Y = V295, FBAMFreq_Z = V296,
                       FBAJM_X = V345, FBAJM_Y = V346, FBAJM_Z = V347,
                       FBAJMFreq_X = V373, FBAJMFreq_Y = V374, FBAJMFreq_Z= V375,
                       FBGM_X = V424, FBGM_Y = V425,FBGM_Z = V426,
                       FBGMFreq_X = V452, FBGMFreq_Y = V453, FBGMFreq_Z = V454,
                       FBAMagM = V503, FBAMagMFreq = V513, FBBAJMagM = V516,
                       FBBAJMagMFreq = V526, FBBGMagM = V529,FBBGMagMFreq = V539,
                       FBBGJMagM = V542, FBBGJMagMFreq = V552,
                       TBAstd_X= V4,TBAstd_Y= V5, TBAstd_Z = V6,
                       TGrAstd_X = V44, TGrAstd_Y = V45, TGrAstd_Z = V46,
                       TBAJstd_X = V84, TBAJstd_Y = V85, TBAJstd_Z = V86,
                       TBGstd_X = V124, TBGstd_Y = V125, TBGstd_Z = V126,
                       TBGJst_X = V164, TBGJst_Y = V165, TBGJst_Z = V166,
                       TBAMagstd = V202, TGrAMagstd = V215, TBAJMagstd = V228,
                       TBGMagstd = V241, TBGJMagstd = V254, 
                       FBAstd_X = V269, FBAstd_Y = V270, FBAstd_Z = V271,
                       FBAJstd_X = V348, FBAJstd_Y = V349, FBAJstd_Z = V350,
                       FBGstd_X = V427, FBGstd_Y = V428, FBGstd_Z = V429,
                       FBAMagstd = V504, FBBAJMagstd = V517, 
                       FBBGMagstd = V530, cFBBGJMagstd= V543
 )
useWholeData <- rename(useWholeData,  Activity_Code = V1.1)
library("plyr")

##9
averageMeas_Activity <- ddply(useWholeData, .(Activity_Code),summarize, 
                     mean=mean(useWholeData[,1], na.rm=TRUE))

subset1 <- subset(useWholeData, Activity_Code == 1)
subset2 <- subset(useWholeData, Activity_Code == 2)
subset3 <- subset(useWholeData, Activity_Code == 3)
subset4 <- subset(useWholeData, Activity_Code == 4)
subset5 <- subset(useWholeData, Activity_Code == 5)
subset6 <- subset(useWholeData, Activity_Code == 6)

averageMeans_Act1 <- colMeans((select(subset1, -Activity_Code)))
averageMeans_Act2 <- colMeans((select(subset2, -Activity_Code)))
averageMeans_Act3 <- colMeans((select(subset3, -Activity_Code)))
averageMeans_Act4 <- colMeans((select(subset4, -Activity_Code)))
averageMeans_Act5 <- colMeans((select(subset5, -Activity_Code)))
averageMeans_Act6 <- colMeans((select(subset6, -Activity_Code)))

write.table(useWholeData, file="useWholeData.txt", row.name=FALSE)













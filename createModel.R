# This function is to create AllGrams from training data
# output is fed to runTest.R
# tr = number of trainig data points
# f1-f5 frequency cut-off

createModel <- function(tr,f2,f3,f4,f5){
        trdata <- sample(finalData$train,tr)
        traindata1 <- dataClean(trdata1)
        uniGrams <<- freqTable(traindata)
        AllGrams <- createAllgrams2(traindata,5,3,3,3,3)
}
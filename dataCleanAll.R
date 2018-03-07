# Step 2A
# This function creates three lists using dataClean on three datasets
# Then combines into one list
# Input objects is the output from dataPrepare.R

dataCleanAll <- function(x) {
        d1 <- dataClean(x$train)
        d2 <- dataClean(x$dev)
        d3 <- dataClean(x$test)
        clean.all <- list(train=d1,dev=d2,test=d3)
        
}
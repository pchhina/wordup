# Step 0
# This function will take a data object and create a list of
# following three data objects
# 1. Train Set
# 2. Dev Set
# 3. Test Set
# This function is called implictly from dataPrepare.R

dataSplit <- function(x) {
        len <- length(x)
        i.train <- sample(1:len,round(0.8*len))
        train <- x[i.train]
        testdev <- x[-i.train]
        split.testdev <- round(0.5*(length(testdev)))
        dev <- testdev[1:split.testdev]
        test <- testdev[(split.testdev+1):length(testdev)]
        split <- list(train=train,dev=dev,test=test)
}
# This function create a clean dev data
# so that the tests are consistent
# dv = number of dev data points to test


createDevdata <- function(dv){
        dvdata <- sample(finalData$dev,dv)
        devdata <<- dataClean(dvdata)
}
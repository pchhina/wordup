# Step 1
# This function creates three lists using dataSplit on three datasets
# Then combines into one list
# Input objects is the output from read_lines of text files

dataPrepare <- function(x,y,z) {
        d1 <- dataSplit(x)
        d2 <- dataSplit(y)
        d3 <- dataSplit(z)
        combData <- mapply(c, d1,d2,d3,SIMPLIFY = F)
        
}
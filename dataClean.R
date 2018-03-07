# Step 2B
# The following function will take output of dataPrepare.R
# and clean it up

swear.words <- readLines("swearwords.txt")
pat <- concatenate(swear.words,collapse = "|")
pat.1 <- concatenate(c("\\b","(",pat,")","\\S*"),collapse = "")

dataClean <- function(x) {
        x <- iconv(x, 'UTF-8', 'ASCII')
        x <- VCorpus(VectorSource(x))
        x <- tm_map(x, content_transformer(tolower))
        x <- tm_map(x,removePunctuation)
        x <- tm_map(x,removeNumbers)
        x <- tm_map(x, stripWhitespace)
        x <- concatenate(convert.tm.to.character(x),collapse = " . ")
        x <- str_replace_all(x,"[^\\w\\s\\.]","")
        x <- str_replace_all(x,pat.1,"")
        x <- gsub("\\s+"," ",x) #remove extra white spaces
        return(x)
}
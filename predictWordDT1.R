# Step 4
# This function will predict the next word based on database from createAllgrams

predictWordDT1 <- function(x,mdl,topn) {
        st <- str_to_lower(x)
        st <- trimws(st)
        word.count <- str_count(st,"\\S+")
        x <- st

        next.word.dict <- mdl[(word1 %in% x)]
        next.word.dict[, word1.count := str_count(word1,"\\S+")]
        next.word.dict <- next.word.dict[order(-word1.count,-p2)]
        next.word <- next.word.dict[1:topn,word2]
        return(unique(next.word))

}
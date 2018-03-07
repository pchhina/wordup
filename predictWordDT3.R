# Step 4
# This function will predict the next word based on database from createAllgrams

predictWordDT3 <- function(x,mdl,topn) {
        st <- str_to_lower(x)
        st <- trimws(st)
        word.count <- str_count(st,"\\S+")
        st3 <- st
        st2 <- trimws(str_extract(st3,"\\s.+"))
        st1 <- trimws(str_extract(st2,"\\s.+"))
        x <- c(st3,st2,st1)
        

        next.word.dict <- mdl[(word1 %in% x)]
        next.word.dict[, word1.count := str_count(word1,"\\S+")]
        next.word.dict <- next.word.dict[order(-word1.count,-p2)]
        next.word <- next.word.dict[1:topn,word2]
        return(unique(next.word))

}
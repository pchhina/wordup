# Step 4
# This function will predict the next word based on database from createAllgrams

predictWord <- function(x,mdl,topn) {
        st <- str_to_lower(x)
        st <- trimws(st)
        word.count <- str_count(st,"\\S+")
        if (word.count > 4){ 
        cat("Too Long String!\nPlease type four or less words")
                }
        if (word.count == 4) {
                db <- mdl$fiveGrams
                next.word <- ((db %>% filter(word1==st))$word2)[1:topn]
                if (sum(is.na(next.word))==topn){
                        word.count=word.count-1
                        st <- trimws(str_extract(st,"\\s.+"))
                } else {
                        return(next.word)
                        
                }
                }
        if (word.count == 3) {
                db <- mdl$fourGrams
                next.word <- ((db %>% filter(word1==st))$word2)[1:topn]
                if (sum(is.na(next.word))==topn){
                        word.count=word.count-1
                        st <- trimws(str_extract(st,"\\s.+"))
                } else {
                        return(next.word)
                        
                }
                }
        if (word.count == 2) {
                db <- mdl$triGrams
                next.word <- ((db %>% filter(word1==st))$word2)[1:topn]
                if (sum(is.na(next.word))==topn){
                        word.count=word.count-1
                        st <- trimws(str_extract(st,"\\s.+"))
                } else {
                        return(next.word)
                        
                }
                }
        if (word.count == 1) {
                db <- mdl$biGrams
                next.word <- ((db %>% filter(word1==st))$word2)[1:topn]
                if (sum(is.na(next.word))==topn){
                        next.word <- mdl$uniGrams[1:topn]
                        return(next.word)
                } else {
                        return(next.word)
                }
                }
}
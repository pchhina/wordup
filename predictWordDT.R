# Algorithm for Shiny App!
library(stringr)
library(data.table)

mdl <- readRDS('allgrams3m')
uni <- readRDS('uni')

predictWordDT <- function(x,mdl,topn) {
        st <- str_to_lower(x)
        st <- trimws(st)
        word.count <- str_count(st,"\\S+")
        if (word.count > 4){ 
               st <-  paste(word(st,-(4:1)), collapse = " ")
               word.count <- str_count(st,"\\S+")
        }

        if (word.count == 4) {
                st4 <- st
                st3 <- trimws(str_extract(st4,"\\s.+"))
                st2 <- trimws(str_extract(st3,"\\s.+"))
                st1 <- trimws(str_extract(st2,"\\s.+"))
                x <- c(st4,st3,st2,st1)
        }
        if (word.count == 3) {
                st3 <- st
                st2 <- trimws(str_extract(st3,"\\s.+"))
                st1 <- trimws(str_extract(st2,"\\s.+"))
                x <- c(st3,st2,st1)
        }
        if (word.count == 2) {
                st2 <- st
                st1 <- trimws(str_extract(st2,"\\s.+"))
                x <- c(st2,st1)
        }
        if (word.count == 1) {
                x <- st
        }
        next.word.dict <- mdl[(word1 %in% x)]
        next.word.dict[, word1.count := str_count(word1,"\\S+")]
        next.word.dict <- next.word.dict[order(-word1.count,-p2)]
        next.word <- next.word.dict[1:(topn+3),word2]
        nas <- sum(is.na(next.word))
        unigrams <- sample(uni,nas)
        next.word[is.na(next.word)] <- unigrams # replace NAs with unigrams
        return(unique(next.word)[1:topn])

}
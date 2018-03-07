# Step 3A
# This is a modified version of createAllgrams.R
# unigrams is taking much longer to built
# so i will try different approach
# This function will use buildNgrams.R to create 5,4,3,2 grams
# and frequency table of 1 grams as well
# Input x is the 'train' subset of dataCleanAll.R's output
# Output is a list of all n-grams which will be used in PredictWord.R

createAllgrams2 <- function(x,n=5,f2,f3,f4,f5) {
        fiveGrams <- buildNgrams2(x,n=n)
        fourGrams <- buildNgrams2(x,n=n-1)
        triGrams <- buildNgrams2(x,n=n-2)
        biGrams <- buildNgrams2(x,n=n-3)

#create list

#frequency table
        fiveGrams.freq <- fourGrams %>% 
                select(ngrams,freq) %>% 
                rename(word1 = ngrams,
                       word1.freq = freq)
        fourGrams.freq <- triGrams %>% 
                select(ngrams,freq) %>% 
                rename(word1 = ngrams,
                       word1.freq = freq)
        triGrams.freq <- biGrams %>% 
                select(ngrams,freq) %>% 
                rename(word1 = ngrams,
                       word1.freq = freq)
        biGrams.freq <- uniGrams %>% 
                rename(word1 = Var1,
                       word1.freq = Freq)
# Join to get word1 frequencies
        fiveGrams.Final <- fiveGrams %>% 
                left_join(fiveGrams.freq,by="word1") %>% 
                mutate(prop=freq/word1.freq) %>% 
                filter(freq>=f5) 
        fourGrams.Final <- fourGrams %>% 
                left_join(fourGrams.freq,by="word1")%>% 
                mutate(prop=freq/word1.freq) %>% 
                filter(freq>=f4) 
        triGrams.Final <- triGrams %>% 
                left_join(triGrams.freq,by="word1")%>% 
                mutate(prop=freq/word1.freq) %>% 
                filter(freq>=f3) 
        biGrams.Final <- biGrams %>% 
                left_join(biGrams.freq,by="word1")%>% 
                mutate(prop=freq/word1.freq) %>% 
                filter(freq>=f2) 
        uniGrams.final <- as.character(uniGrams$Var1[1:10])

#create list
        allGrams <- list(fiveGrams=fiveGrams.Final,
                         fourGrams=fourGrams.Final,
                         triGrams=triGrams.Final,
                         biGrams=biGrams.Final,
                         uniGrams=uniGrams.final)
}
# Step 3B
# This is a test function to see if n-gram building can be sped up.          
# Prepare n-grams
# Input to this function will be the output from dataClean function
# other input is 'n' for n-grams 
# ng_phrasetbl.clean is built by filtering grams with "." <s>
# meaning grams containing beginning/end of sentence are filtered
# this function is called implicitly from createAllgrams.R

buildNgrams2 <- function(x,n) {
        x <- trimws(x)
        ng <- ngram(x, n)
        ng_phrasetbl <- data.table(get.phrasetable(ng)) # Option B: Data Table
        ng_phrasetbl.clean <- ng_phrasetbl[!(ngrams %like% "\\.")][
                ,.(ngrams=trimws(ngrams),freq)][
                ,c("word1","word2"):=tstrsplit(ngrams," (?=[^ ]+$)",perl=TRUE)]
        }
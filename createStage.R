# This function sources necessary libraries and functions
# It also create the big data set to start experimenting
library(tm)
library(tidyverse)
library(stringr)
library(ngram)
library(textreg)
library(profvis)
library(data.table)


source("dataClean.R")

source("freqTable.R")
source("buildNgrams2.R")
source("createAllgrams2.R")
source("predictWord.R")


source("createModel.R")
source("createDevdata.R")
source("findAccuracy.R")


finalData <- readRDS("finalData.rds")

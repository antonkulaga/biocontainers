#library(AnnotationDbi)

library(DESeq2)
library(tximport)
library(tximeta)
dir <- "/home/rstudio/samples"
samples <- read.csv(file.path(dir, "test.csv"), header = TRUE)
files <- file.path(samples$run)
#BiocManager::install("EnsDb.Hsapiens.v86")
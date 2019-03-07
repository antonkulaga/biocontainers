library(DESeq2)
library(AnnotationDbi)
dir <- "/home/rstudio/samples"
samples <- read.csv(file.path(dir, "test.csv"), header = TRUE)
files <- file.path(samples$run)

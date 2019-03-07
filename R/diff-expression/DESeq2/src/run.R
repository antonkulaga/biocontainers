library(DESeq2)
library(AnnotationDbi)
samples <- read.csv(file.path(dir, "test.csv"), header = TRUE)
files = file.path(samples$run)

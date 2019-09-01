if (!requireNamespace("BiocManager", quietly = TRUE))
install.packages("BiocManager")

BiocManager::install("DESeq2")
BiocManager::install("WGCNA")
BiocManager::install("sva")

install.packages("MXM")
install.packages("dplyr")
install.packages("bestNormalize")
install.packages("glmnet")
install.packages("data.table")
install.packages("org.Hs.eg.db")
install.packages("caret")
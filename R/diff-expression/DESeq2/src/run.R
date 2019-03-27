library(DESeq2)
library(tximport)
library(tximeta)
dir <- "/home/rstudio/samples"
samples <- read.csv(file.path(dir, "test.csv"), header = TRUE)
files <- file.path(samples$files)

tx2gene = read.csv(file.path(dir, "gencode.vM20.metadata.EntrezGene"), sep = "\t")
colnames(tx2gene) <- c("TXNAME","GENEID")
txi <- tximport(files, type = "salmon", tx2gene = tx2gene, ignoreAfterBar = TRUE)
ddsTxi <- DESeqDataSetFromTximport(txi, colData = samples, design = ~ 1)
dds <- DESeq(ddsTxi)
res <- results(dds)
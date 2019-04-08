#!/usr/bin/env Rscript
library(optigrab)
library(tximport)

conversion = opt_get("transcripts2genes", default = "/data/indexes/gencode.vM20.metadata.EntrezGene")
samples = opt_get("samples")

if(!is.na(samples)) {
    print("")
} else {
    if(!is.na(conversion)) {
        tx2gene = read.csv(file.path(dir, conversion), sep = "\t")
        print("LOADING SAMPLES!")
        print(opt$samples)
        samples <- read.csv(samples, header = TRUE)
        files <- file.path(samples$files)
        tx2gene = read.csv(file.path(dir, "gencode.vM20.metadata.EntrezGene"), sep = "\t")
        colnames(tx2gene) <- c("TXNAME","GENEID")
        txi <- tximport(files, type = "salmon", tx2gene = tx2gene, ignoreAfterBar = TRUE)
        ddsTxi <- DESeqDataSetFromTximport(txi, colData = samples, design = ~ 1)
        dds <- DESeq(ddsTxi)
        res <- results(dds)
        print(res)

    } else {

    }
}
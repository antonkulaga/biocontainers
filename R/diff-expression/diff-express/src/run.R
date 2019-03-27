#!/usr/bin/env Rscript
suppressPackageStartupMessages(library("optparse"))
suppressPackageStartupMessages(library("stats"))

option_list <- list(
    make_option(c("-s", "--samples"), help="give .tsv files with samples",
metavar="number")
)

# get command line options, if help option encountered print help and exit,
# otherwise if options not found on command line then set defaults,
opt <- parse_args(OptionParser(option_list=option_list))

# print some progress messages to stderr if "quietly" wasn't requested
if ( opt$samples ) {
    library(DESeq2)
    library(tximport)
    library(tximeta)
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
}
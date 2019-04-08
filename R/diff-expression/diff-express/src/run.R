#!/usr/bin/env Rscript
install.packages("argparse")
library("argparse")

parser = ArgumentParser(prog='PROG')
subparsers = parser$add_subparsers(help='sub-command help')
to_genes = subparsers$add_parser('transcripts2genes', help='transcripts to genes')
to_genes$add_argument('bar', type='integer', help='bar help')

# create the parser for the "b" command
parser_b = subparsers$add_parser('b', help='b help')
parser_b$add_argument('--baz', choices='XYZ', help='baz help')

option_list <- list(
    make_option(c("-s", "--samples"), help="give .tsv files with samples",
metavar="number")
)

# get command line options, if help option encountered print help and exit,
# otherwise if options not found on command line then set defaults,
opt <- parse_args(OptionParser(option_list=option_list))

# print some progress messages to stderr if "quietly" wasn't requested
if ( opt$samples == NULL) {
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
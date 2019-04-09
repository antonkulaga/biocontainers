#!/usr/bin/env Rscript
library(optigrab)
library(tximport)

conversion = opt_get("transcripts2genes")
samples = opt_get("samples", required = TRUE)
name = opt_get("name", "")
folder = opt_get("folder", getwd())


saveTxi = function(txi, folder, prefix){
    dir.create(folder, showWarnings = FALSE)
    write.table(txi$length, file.path(folder, paste(prefix, "length.tsv", sep="_")), sep="\t", col.names = FALSE)
    write.table(txi$abundance, file.path(folder, paste(prefix, "abundance.tsv", sep="_")), sep="\t", col.names = FALSE)
    write.table(txi$counts, file.path(folder, paste(prefix, "counts.tsv", sep="_")), sep="\t", col.names = FALSE)
    txi
}

process = function(name, samples, folder, conversion, countsFromAbudance = "no") {
    dir.create(folder, showWarnings = FALSE)
    transcripts = tximport(samples, type = "salmon", ignoreAfterBar = TRUE, txOut = TRUE, countsFromAbundance = countsFromAbudance)
    t_folder = file.path(folder, "transcripts")
    dir.create(t_folder, showWarnings = FALSE)
    t_prefix = if(name=="") "transcripts" else paste(name, "transcripts", sep="_")
    saveTxi(transcripts, t_folder, t_prefix)
    if(!is.na(conversion)){
        genes_folder = file.path(folder, "genes")
        dir.create(genes_folder, showWarnings = FALSE)
        tx2gene = read.csv(conversion, sep = "\t")
        g_prefix = if(name=="") "genes" else paste(name, "genes", sep="_")
        saveTxi(transcripts, genes_folder, g_prefix)
        genes = summarizeToGene(transcripts, tx2gene = tx2gene, ignoreAfterBar = TRUE, countsFromAbundance = countsFromAbudance)
    }
}

processMany = function(name, samplesTSV, folder, conversion, countsFromAbudance = "no") {
    tsv <- read.csv(samplesTSV, header = TRUE, sep = "\t")
    samples = file.path(tsv$files)
    process(name, samples, folder, conversion, countsFromAbudance)
}

if(!is.na(samples)) {
    if(endsWith(samples, ".tsv")) processMany(name, samples, folder, conversion) else process(name, samples, folder, conversion)
} else {
    opt_help()
}
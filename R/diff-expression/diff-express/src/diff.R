#!/usr/bin/env Rscript
library(optigrab)
library(tximport)

conversion = opt_get("transcripts2genes")
samples = opt_get("samples", required = TRUE)
name = opt_get("name", "")
folder = opt_get("folder", getwd())

#TODO: write differential expression

if(!is.na(samples)) {
    if(endsWith(samples, ".tsv")) processMany(name, samples, folder, conversion) else process(name, samples, folder, conversion)
} else {
    opt_help()
}
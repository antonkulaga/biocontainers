#!/usr/bin/env Rscript

library(optigrab)
species = opt_get("species", required = TRUE) #example: hsapiens for human
output = opt_get("output", default = "tx2genes.tsv")
colnames = opt_get("columns", default = FALSE)

# R code for convert gene/transcripts names
library(biomaRt)

getMapping = function (organism) {
    features=c("ensembl_transcript_id","entrezgene","ensembl_gene_id","external_gene_name")
    hmart=useMart("ENSEMBL_MART_ENSEMBL", dataset=paste(organism, "gene_ensembl", sep="_"), host="www.ensembl.org")
    return(getBM(attributes=features,mart=hmart))
}
write.table(getMapping(species), output ,sep="\t",quote=FALSE,row.names=FALSE,col.names=colnames)

#!/usr/bin/env Rscript

library(optigrab)
species = opt_get("species", required = TRUE) #example: hsapiens for human
output = opt_get("output", default = "tx2genes.tsv")
colnames = opt_get("columns", default = FALSE)
features = opt_get("features", n = 4)#, default = c("ensembl_transcript_id", "ensembl_gene_id"), n = 4)

# R code for convert gene/transcripts names
library(biomaRt)
library(biomartr)

getMapping = function (organism, features) {
  o = biomartr::organismBM(organism = organism) 
  i = endsWith(o$dataset, "_gene_ensembl")
  d = o$dataset[endsWith(o$dataset, "_gene_ensembl")][1]
  hmart=biomaRt::useMart("ENSEMBL_MART_ENSEMBL", dataset=d, host="www.ensembl.org")
  result = biomaRt::getBM(attributes=features,mart=hmart)
  return(result)
}
write.table(getMapping(species, features), output ,sep="\t",quote=FALSE,row.names=FALSE,col.names=colnames)

#!/usr/bin/env Rscript

library(optigrab)
species_folder = opt_get(default="/data/ensembl/97/species")
output_folder = opt_get("output", default = "/data/ensembl/97/species/tx2gene")
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

capitalize <- function(s) {
  gsub("_", " ", paste(toupper(substring(s, 1, 1)), substring(s, 2), sep=""))
}


writeMapping <- function(organism, features, where) {
  tryCatch( {
  mapping = getMapping(organism, features)
  write.table(mapping, where, sep="\t")
  print(paste("mapping of", organism, "has been written to", where, "!"))
  }, error = function(e) print(paste(organism, "tx2genes created failed because of", e))
  )
  where
}

map_all <- function(path, features, out) {
  folds <- capitalize(dir(path))
  p <- gsub(" ", "_", paste0(path, "/", organism, "_tx2gene.tsv"))
  lapply(folds, function(x) { writeMapping(x, features,  p)})
}

map_all(species_folder)
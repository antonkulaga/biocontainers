#!/usr/bin/env Rscript

library(optigrab)
species_folder = opt_get("species", default="/data/ensembl/101/species")
output_folder = opt_get("output", default = "/data/ensembl/101/species/tx2gene")
colnames = opt_get("columns", default = FALSE)
features = opt_get("features", default = c("ensembl_transcript_id", "ensembl_gene_id"), n = 4)
host = opt_get("host", default = "www.ensembl.org") #

# R code for convert gene/transcripts names
library(biomaRt)
library(biomartr)
library(S4Vectors)

getMapping = function (organism, features, host) {
  if(grepl("female", organism)) {
    hmart=biomaRt::useMart("ENSEMBL_MART_ENSEMBL", dataset="hfemale_gene_ensembl", host=host)
  } else if(grepl("male", organism)) {
    hmart=biomaRt::useMart("ENSEMBL_MART_ENSEMBL", dataset="hmale_gene_ensembl", host=host)
  }
  else
    {
      o = biomartr::organismBM(organism = organism) 
      i = endsWith(o$dataset, "_gene_ensembl")
      d = o$dataset[endsWith(o$dataset, "_gene_ensembl")][1]
      hmart=biomaRt::useMart("ENSEMBL_MART_ENSEMBL", dataset=d, host=host)
    }
  result = biomaRt::getBM(attributes=features,mart=hmart)
  return(result)
}

capitalize <- function(s) {
  gsub("_", " ", paste(toupper(substring(s, 1, 1)), substring(s, 2), sep=""))
}


writeMapping <- function(organism, features, where, colnames = FALSE, host = "www.ensembl.org") {
  tryCatch( {
  mapping = getMapping(organism, features, host)
  write.table(mapping, where, sep="\t", quote=FALSE, row.names=FALSE, col.names=colnames)
  print(paste("mapping of", organism, "has been written to", where, "!"))
  }, error = function(e) print(paste(organism, "tx2genes creation failed because of", e))
  )
  where
}

map_all <- function(species_folder = "/data/ensembl/101/species", 
                    features = c("ensembl_transcript_id", "ensembl_gene_id"), 
                    output_folder= "/data/ensembl/101/species/tx2gene", 
                    colnames = FALSE, host = "www.ensembl.org") {
  dirs = dir(species_folder)
  folds <- capitalize(dirs[dirs!="tx2gene"])
  species = basename(folds)
  dir.create(output_folder, showWarnings = FALSE)
  p <- gsub(" ", "_", paste0(output_folder, "/", folds, ".tsv"))
  pairs = zipdown(zipup(species, p))
  lapply(pairs, function(x) { writeMapping(x@first, features,  x@second, colnames, host)})
  }

map_all(species_folder, features, output_folder, colnames)

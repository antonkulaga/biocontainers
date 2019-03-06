library("Biocmanager")
to_install <- c("Matrix", "KernSmooth", "mgcv", "devtools", "biomaRt", "GEOmetadb", "SRAdb", "Biostrings", "BiocGenerics", "tximport")
BiocManager::install(to_install)
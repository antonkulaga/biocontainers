if ("BiocInstaller" %in% rownames(installed.packages()))
remove.packages("BiocInstaller")

install.packages("BiocManager")
to_install <- c("Matrix", "KernSmooth", "mgcv", "devtools", "biomaRt", "GEOmetadb", "SRAdb", "Biostrings", "BiocGenerics", "AnnotationDbi", "tximport", "optparse", "ensembldb")
BiocManager::install(to_install)
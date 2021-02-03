yfif ("BiocInstaller" %in% rownames(installed.packages()))
remove.packages("BiocInstaller")

install.packages("BiocManager")
to_install <- c(
    "Matrix", "KernSmooth", "mgcv", "Biostrings", "BiocGenerics", "S4Vectors",
    "devtools", "tximport", "tximeta", "optigrab", "optparse", #for development, counts import and CLI
    "biomaRt","biomartr", "GEOmetadb", "SRAdb", "AnnotationDbi", "ensembldb", "AHEnsDbs", #for annotations
    "missForest", "doParallel"
)
BiocManager::install(to_install)
#install.packages("biomartr", dependencies = TRUE)
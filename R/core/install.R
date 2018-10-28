if ("BiocInstaller" %in% rownames(installed.packages()))
remove.packages("BiocInstaller")
source("https://install-github.me/r-lib/remotes")

url <- "http://bioconductor.org/packages/3.7/bioc"
install.packages("BiocInstaller", repos=url)

to_install <- c("Matrix", "KernSmooth", "mgcv", "devtools", "biomaRt", "GEOmetadb", "SRAdb", "Biostrings", "BiocGenerics")

for (pack in to_install)
    if (!suppressWarnings(require(pack, character.only=TRUE)))
        BiocInstaller::biocLite(pack)
suppressWarnings(BiocInstaller::biocValid(fix=TRUE, ask=FALSE))
suppressWarnings(install.packages("optparse"))
suppressWarnings(install.packages('tidyverse', dependencies=TRUE, type="source"))
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install("rnaseqDTU", version = "devel")
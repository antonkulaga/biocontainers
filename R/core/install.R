if ("BiocInstaller" %in% rownames(installed.packages()))
remove.packages("BiocInstaller")
#chooseCRANmirror()
install.packages("BiocManager")

#source("https://install-github.me/r-lib/remotes")
#url <- "http://bioconductor.org/packages/3.8/bioc"
#install.packages("BiocInstaller", repos=url)

to_install <- c("Matrix", "KernSmooth", "mgcv", "devtools", "biomaRt", "GEOmetadb", "SRAdb", "Biostrings", "BiocGenerics", "tximport")
BiocManager::install(to_install)